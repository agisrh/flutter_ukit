import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'package:flutter_ukit/models/dropdown_builder.dart';

class UKitDropdownController<T> extends ChangeNotifier {
  T? _value;
  UKitDropdownController({T? value}) : _value = value;

  T? get value => _value;
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}

/// Create a dropdown form field
class UKitDropdownFormField<T> extends StatefulWidget {
  final bool autoFocus;

  /// It will trigger on user search
  final bool Function(T item, String str)? filterFn;

  /// Check item is selectd
  final bool Function(T? item1, T? item2)? selectedFn;

  /// Return list of items what need to list for dropdown.
  /// The list may be offline, or remote data from server.
  final Future<List<T>> Function(String str) findFn;

  /// Build dropdown Items, it get called for all dropdown items
  ///  [item] = [dynamic value] List item to build dropdown Listtile
  /// [lasSelectedItem] = [null | dynamic value] last selected item, it gives user chance to highlight selected item
  /// [position] = [0,1,2...] Index of the list item
  /// [focused] = [true | false] is the item if focused, it gives user chance to highlight focused item
  /// [onTap] = [Function] *important! just assign this function to Listtile.onTap  = onTap, incase you missed this,
  /// the click event if the dropdown item will not work.
  ///
  final ListTile Function(
    T item,
    int position,
    bool focused,
    bool selected,
    Function() onTap,
  ) dropdownItemFn;

  /// Build widget to display selected item inside Form Field
  final Widget Function(T? item) displayItemFn;

  //final InputDecoration? decoration;

  final UKitDropdownController<T>? controller;
  final void Function(T item)? onChanged;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;

  /// height of the dropdown overlay, Default: 240
  final double? dropdownHeight;

  /// Style the search box text
  final TextStyle? searchTextStyle;

  /// Message to disloay if the search dows not match with any item, Default : "No matching found!"
  final String? emptyText;

  /// Give action text if you want handle the empty search.
  final String emptyActionText;

  /// this functon triggers on click of emptyAction button
  final Future<void> Function()? onEmptyActionPressed;

  /// Style decoration form
  final UKitDropdownBuilder? as;

  const UKitDropdownFormField({
    Key? key,
    required this.dropdownItemFn,
    required this.displayItemFn,
    required this.findFn,
    this.filterFn,
    this.autoFocus = false,
    this.controller,
    this.validator,
    this.label,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSaved,
    this.dropdownHeight,
    this.searchTextStyle,
    this.emptyText,
    this.emptyActionText = 'Create new',
    this.onEmptyActionPressed,
    this.selectedFn,
    this.as,
  }) : super(key: key);

  @override
  UKitDropdownFormFieldState createState() => UKitDropdownFormFieldState<T>();
}

class UKitDropdownFormFieldState<T> extends State<UKitDropdownFormField>
    with SingleTickerProviderStateMixin {
  final FocusNode _widgetFocusNode = FocusNode();
  final FocusNode _searchFocusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final ValueNotifier<List<T>> _listItemsValueNotifier =
      ValueNotifier<List<T>>([]);
  final TextEditingController _searchTextController = TextEditingController();
  final UKitDropdownController<T> _controller = UKitDropdownController<T>();

  // ignore: prefer_function_declarations_over_variables
  final Function(T?, T?) _selectedFn =
      (dynamic item1, dynamic item2) => item1 == item2;

  bool get _isEmpty => _selectedItem == null;
  bool _isFocused = false;

  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayBackdropEntry;
  List<T>? _options;
  int _listItemFocusedPosition = 0;
  T? _selectedItem;
  Widget? _displayItem;
  Timer? _debounce;
  String? _lastSearchString;

  UKitDropdownController<dynamic>? get _effectiveController =>
      widget.controller ?? _controller;

  UKitDropdownFormFieldState() : super();

  @override
  void initState() {
    super.initState();
    if (widget.autoFocus) _widgetFocusNode.requestFocus();
    _selectedItem = _effectiveController!.value;

    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && _overlayEntry != null) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _displayItem = widget.displayItemFn(_selectedItem);

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          _widgetFocusNode.requestFocus();
          _toggleOverlay();
        },
        child: Focus(
          autofocus: widget.autoFocus,
          focusNode: _widgetFocusNode,
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          onKeyEvent: (focusNode, event) {
            return _onKeyPressed(event);
          },
          child: FormField(
            validator: (str) {
              if (widget.validator != null) {
                widget.validator!(_effectiveController!.value);
              }
              return null;
            },
            onSaved: (str) {
              if (widget.onSaved != null) {
                widget.onSaved!(_effectiveController!.value);
              }
            },
            builder: (state) {
              return InputDecorator(
                decoration: decoration,
                isEmpty: _isEmpty,
                isFocused: _isFocused,
                child: _overlayEntry != null
                    ? EditableText(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        controller: _searchTextController,
                        cursorColor: Colors.black87,
                        focusNode: _searchFocusNode,
                        backgroundCursorColor: Colors.transparent,
                        onChanged: (str) {
                          if (_overlayEntry == null) {
                            _addOverlay();
                          }
                          _onTextChanged(str);
                        },
                        onSubmitted: (str) {
                          _searchTextController.value =
                              const TextEditingValue(text: "");
                          _setValue();
                          _removeOverlay();
                          _widgetFocusNode.nextFocus();
                        },
                        onEditingComplete: () {},
                      )
                    : _displayItem ?? const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }

  ///
  ///  Input Decoration
  ///
  InputDecoration get decoration {
    return InputDecoration(
      enabledBorder: inputBorder(
        borderType: widget.as?.borderType,
        borderColor: UKitUtils.getColor(
          widget.as,
          widget.as?.borderColor,
          widget.as?.borderColor,
          Colors.grey,
        ),
      ),
      focusedBorder: inputBorder(
        borderType: widget.as?.borderType,
        borderColor: UKitUtils.getColor(
          widget.as,
          widget.as?.focusBorderColor,
          widget.as?.focusBorderColor,
          Colors.grey,
        ),
      ),
      errorBorder: inputBorder(
        borderType: widget.as?.borderType,
        borderColor: UKitUtils.getColor(
          widget.as,
          widget.as?.errorBorderColor,
          widget.as?.errorBorderColor,
          Colors.red,
        ),
      ),
      fillColor: UKitUtils.getColor(
        widget.as,
        widget.as?.bgColor,
        widget.as?.bgColor,
        Colors.transparent,
      ),
      filled: widget.as?.bgColor != null,
      errorStyle: const TextStyle(color: Colors.red),
      contentPadding: EdgeInsets.all(widget.as?.padding ?? 20.0),
      labelText: widget.label,
      labelStyle: TextStyle(
        color: UKitUtils.getColor(
          widget.as,
          widget.as?.labelColor,
          widget.as?.labelColor,
          Colors.black,
        ),
      ),
      suffixIcon: widget.suffix ??
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
      prefixIcon: widget.prefix,
      floatingLabelBehavior: widget.as?.floatingLabelBehavior,
    );
  }

  ///
  /// Input Border Decoration
  ///
  InputBorder? inputBorder({
    Color? borderColor,
    UKitBorderType? borderType,
  }) {
    // ignore: unrelated_type_equality_checks
    if (borderType == UKitBorderType.outlineBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            UKitUtils.getDouble(
              widget.as,
              widget.as?.borderRadius,
              widget.as?.borderRadius,
              4.0,
            ),
          ),
        ),
        borderSide: BorderSide(
          color: borderColor ?? Colors.grey,
          width: UKitUtils.getDouble(
            widget.as,
            widget.as?.borderWidth,
            widget.as?.borderWidth,
            1.0,
          ),
        ),
      );
      // ignore: unrelated_type_equality_checks
    } else if (borderType == UKitBorderType.underlineBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? Colors.grey,
          width: UKitUtils.getDouble(
            widget.as,
            widget.as?.borderWidth,
            widget.as?.borderWidth,
            1.0,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderObject = context.findRenderObject() as RenderBox;
    final Size size = renderObject.size;

    var overlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 3.0),
            child: Material(
              elevation: widget.as?.elevation ?? 4.0,
              child: SizedBox(
                height: widget.dropdownHeight ?? 240,
                child: Container(
                  color: widget.as?.dropdownColor ?? Colors.white70,
                  child: ValueListenableBuilder(
                    valueListenable: _listItemsValueNotifier,
                    builder: (context, List<T> items, child) {
                      return _options != null && _options!.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: _options!.length,
                              itemBuilder: (context, position) {
                                T item = _options![position];
                                onTap() {
                                  _listItemFocusedPosition = position;
                                  _searchTextController.value =
                                      const TextEditingValue(text: "");
                                  _removeOverlay();
                                  _setValue();
                                }

                                ListTile listTile = widget.dropdownItemFn(
                                  item,
                                  position,
                                  position == _listItemFocusedPosition,
                                  (widget.selectedFn ?? _selectedFn)(
                                      _selectedItem, item),
                                  onTap,
                                );

                                return listTile;
                              })
                          : Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.emptyText ?? "No matching found!",
                                    style:
                                        const TextStyle(color: Colors.black45),
                                  ),
                                  if (widget.onEmptyActionPressed != null)
                                    TextButton(
                                      onPressed: () async {
                                        await widget.onEmptyActionPressed!();
                                        _search(
                                            _searchTextController.value.text);
                                      },
                                      child: Text(widget.emptyActionText),
                                    ),
                                ],
                              ),
                            );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    return overlay;
  }

  OverlayEntry _createBackdropOverlay() {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: 0,
        top: 0,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            _removeOverlay();
          },
        ),
      ),
    );
  }

  _addOverlay() {
    if (_overlayEntry == null) {
      _search("");
      _overlayBackdropEntry = _createBackdropOverlay();
      _overlayEntry = _createOverlayEntry();
      if (_overlayEntry != null) {
        // Overlay.of(context)!.insert(_overlayEntry!);
        Overlay.of(context).insertAll([_overlayBackdropEntry!, _overlayEntry!]);
        setState(() {
          _searchFocusNode.requestFocus();
        });
      }
    }
  }

  /// Dettach overlay from the dropdown widget
  _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayBackdropEntry!.remove();
      _overlayEntry!.remove();
      _overlayEntry = null;
      _searchTextController.value = TextEditingValue.empty;
      setState(() {});
    }
  }

  _toggleOverlay() {
    if (_overlayEntry == null) {
      _addOverlay();
    } else {
      _removeOverlay();
    }
  }

  _onTextChanged(String? str) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // print("_onChanged: $_lastSearchString = $str");
      if (_lastSearchString != str) {
        _lastSearchString = str;
        _search(str ?? "");
      }
    });
  }

  _onKeyPressed(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      if (_searchFocusNode.hasFocus) {
        _toggleOverlay();
      } else {
        _toggleOverlay();
      }
      //return false;
      return KeyEventResult.ignored;
    } else if (event.logicalKey == LogicalKeyboardKey.escape) {
      _removeOverlay();
      return KeyEventResult.handled;
      //return true;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      int v = _listItemFocusedPosition;
      v++;
      if (v >= _options!.length) v = 0;
      _listItemFocusedPosition = v;
      _listItemsValueNotifier.value = List<T>.from(_options ?? []);
      //return true;
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      int v = _listItemFocusedPosition;
      v--;
      if (v < 0) v = _options!.length - 1;
      _listItemFocusedPosition = v;
      _listItemsValueNotifier.value = List<T>.from(_options ?? []);
      //return true;
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
    //return false;
  }

  _search(String str) async {
    List<T> items = await widget.findFn(str) as List<T>;
    if (str.isNotEmpty && widget.filterFn != null) {
      items = items.where((item) => widget.filterFn!(item, str)).toList();
    }
    _options = items;
    _listItemsValueNotifier.value = items;
  }

  _setValue() {
    var item = _options![_listItemFocusedPosition];
    _selectedItem = item;
    _effectiveController!.value = _selectedItem;

    if (widget.onChanged != null) {
      widget.onChanged!(_selectedItem);
    }

    setState(() {});
  }
}
