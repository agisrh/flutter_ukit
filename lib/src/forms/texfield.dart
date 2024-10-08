import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'package:flutter_ukit/models/textfield_builder.dart';

class UKitTextField extends StatefulWidget {
  const UKitTextField({
    super.key,
    this.as,
    this.hint,
    this.label,
    this.initialValue,
    this.validator,
    this.borderRadius,
    this.borderType,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.borderWidth,
    this.hintColor,
    this.labelColor,
    this.obscureText,
    this.keyboardType,
    required this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.controller,
    this.bgColor,
    this.floatingLabelBehavior,
    this.suffix,
    this.prefix,
    this.maxLength,
    this.maxLines,
    this.readOnly,
    this.textCapitalization,
    this.showObscureSwitch,
    this.focusNode,
    this.suffixIconConstraints,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.textInputAction,
  });

  @required
  final String? hint;
  final String? label;
  final String? initialValue;
  final UKitTextFieldBuilder? as;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final double? borderRadius;
  final UKitBorderType? borderType;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final double? borderWidth;
  final Color? hintColor;
  final Color? labelColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function onChanged;
  final Function? onTap;
  final Function? onSubmitted;
  final Color? bgColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final int? maxLines;
  final bool? readOnly;
  final TextCapitalization? textCapitalization;
  final bool? showObscureSwitch;
  final FocusNode? focusNode;
  final BoxConstraints? suffixIconConstraints;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  @override
  State<UKitTextField> createState() => _UKitTextFieldState();

  ///
  /// Native Text Fields
  ///
  static Widget native({
    String? hint,
    String? label,
    String? initialValue,
    Color? hintColor,
    double? padding,
    Color? bgColor,
    Color? labelColor,
    Color? borderColor,
    Color? focusBorderColor,
    bool? obscureText,
    required Function onChanged,
    Widget? suffix,
    Widget? prefix,
    TextInputType? keyboardType,
    TextEditingController? controller,
    int? maxLength,
    int? maxLines,
    bool? readOnly,
    TextCapitalization? textCapitalization,
    FocusNode? focusNode,
    BoxConstraints? suffixIconConstraints,
    TextAlign? textAlign,
    List<TextInputFormatter>? inputFormatters,
    Function? onSubmitted,
    TextInputAction? textInputAction,
  }) {
    if (Platform.isIOS) {
      return iosTextField(
        hint,
        label,
        hintColor,
        padding,
        bgColor,
        labelColor,
        borderColor,
        focusBorderColor,
        obscureText,
        onChanged,
        suffix,
        prefix,
        keyboardType,
        controller,
        maxLength,
        maxLines,
        readOnly,
        textCapitalization,
        focusNode,
        onSubmitted,
        textInputAction,
      );
    } else {
      return androidTextField(
        hint,
        label,
        initialValue,
        hintColor,
        padding,
        bgColor,
        labelColor,
        borderColor,
        focusBorderColor,
        obscureText,
        onChanged,
        suffix,
        prefix,
        keyboardType,
        controller,
        maxLength,
        maxLines,
        readOnly,
        textCapitalization,
        focusNode,
        textAlign,
        inputFormatters,
        onSubmitted,
        textInputAction,
      );
    }
  }
}

class _UKitTextFieldState extends State<UKitTextField> {
  bool obscureText = false;
  @override
  void initState() {
    obscureText = !(widget.obscureText ?? false) ? (widget.showObscureSwitch ?? false) : (widget.obscureText ?? false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      decoration: decoration,
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged as void Function(String),
      onTap: widget.onTap as void Function()?,
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      readOnly: widget.readOnly ?? false,
      focusNode: widget.focusNode,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onSubmitted as void Function(String)?,
      textInputAction: widget.textInputAction,
      style: TextStyle(color: widget.as?.textColor ?? Colors.black, fontSize: widget.as?.fontSize ?? 14.0),
    );
  }

  ///
  ///  Input Decoration
  ///
  InputDecoration get decoration {
    return InputDecoration(
      enabledBorder: inputBorder(
        borderColor: UKitUtils.getColor(widget.as, widget.as?.borderColor, widget.borderColor, Colors.blue),
      ),
      focusedBorder: inputBorder(
        borderColor: UKitUtils.getColor(widget.as, widget.as?.focusBorderColor, widget.focusBorderColor, Colors.blue),
      ),
      errorBorder: inputBorder(
        borderColor: UKitUtils.getColor(widget.as, widget.as?.errorBorderColor, widget.errorBorderColor, Colors.red),
      ),
      focusedErrorBorder: inputBorder(
        borderColor: UKitUtils.getColor(widget.as, widget.as?.focusBorderColor, widget.focusBorderColor, Colors.red),
      ),
      fillColor: UKitUtils.getColor(widget.as, widget.as?.bgColor, widget.bgColor, Colors.transparent),
      filled: widget.bgColor != null || widget.as?.bgColor != null,
      errorStyle: const TextStyle(color: Colors.red),
      contentPadding: EdgeInsets.all(widget.as?.contentPadding ?? 20.0),
      hintText: widget.hint,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: UKitUtils.getColor(widget.as, widget.as?.hintColor, widget.hintColor, Colors.black),
        fontSize: widget.as?.fontSize ?? 14.0,
      ),
      labelText: widget.label,
      labelStyle: TextStyle(
        color: UKitUtils.getColor(widget.as, widget.as?.labelColor, widget.labelColor, Colors.black),
      ),
      suffixIconConstraints: widget.suffixIconConstraints ?? const BoxConstraints(maxHeight: 14),
      suffixIcon: (widget.showObscureSwitch ?? false)
          ? InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            )
          : widget.suffix,
      prefixIcon: widget.prefix,
      floatingLabelBehavior: widget.floatingLabelBehavior,
    );
  }

  ///
  /// Input Border Decoration
  ///
  InputBorder? inputBorder({
    Color? borderColor,
  }) {
    if (widget.as?.borderType == UKitBorderType.outlineBorder || widget.borderType == UKitBorderType.outlineBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            UKitUtils.getDouble(widget.as, widget.as?.borderRadius, widget.borderRadius, 4.0),
          ),
        ),
        borderSide: BorderSide(
          color: borderColor!,
          width: UKitUtils.getDouble(widget.as, widget.as?.borderWidth, widget.borderWidth, 1.0),
        ),
      );
    } else if (widget.as?.borderType == UKitBorderType.underlineBorder ||
        widget.borderType == UKitBorderType.underlineBorder) {
      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: borderColor!,
          width: UKitUtils.getDouble(widget.as, widget.as?.borderWidth, widget.borderWidth, 1.0),
        ),
      );
    } else {
      return null;
    }
  }
}

///
/// Android Text Field
///
TextFormField androidTextField(
  String? hint,
  String? label,
  String? initialValue,
  Color? hintColor,
  double? padding,
  Color? bgColor,
  Color? labelColor,
  Color? borderColor,
  Color? focusBorderColor,
  bool? obscureText,
  Function? onChanged,
  Widget? suffix,
  Widget? prefix,
  TextInputType? keyboardType,
  TextEditingController? controller,
  int? maxLength,
  int? maxLines,
  bool? readOnly,
  TextCapitalization? textCapitalization,
  FocusNode? focusNode,
  TextAlign? textAlign,
  List<TextInputFormatter>? inputFormatters,
  Function? onSubmitted,
  TextInputAction? textInputAction,
) {
  return TextFormField(
    initialValue: initialValue,
    onChanged: onChanged as void Function(String),
    textCapitalization: textCapitalization ?? TextCapitalization.none,
    obscureText: obscureText ?? false,
    keyboardType: keyboardType,
    controller: controller,
    maxLength: maxLength,
    maxLines: maxLines ?? 1,
    readOnly: readOnly ?? false,
    focusNode: focusNode,
    textAlign: textAlign ?? TextAlign.start,
    inputFormatters: inputFormatters,
    onFieldSubmitted: onSubmitted as void Function(String)?,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      fillColor: bgColor ?? Colors.transparent,
      filled: bgColor != null,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: padding ?? 10.0),
        child: suffix,
      ),
      contentPadding: EdgeInsets.all(padding ?? 10.0),
      hintText: hint,
      labelText: label,
      labelStyle: TextStyle(
        color: labelColor ?? Colors.black,
      ),
      hintStyle: TextStyle(
        color: hintColor ?? Colors.black,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? Colors.black,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: focusBorderColor ?? Colors.blue,
        ),
      ),
    ),
  );
}

///
/// iOS Text Field
///
CupertinoTextField iosTextField(
  String? hint,
  String? label,
  Color? hintColor,
  double? padding,
  Color? bgColor,
  Color? labelColor,
  Color? borderColor,
  Color? focusBorderColor,
  bool? obscureText,
  Function onChanged,
  Widget? suffix,
  Widget? prefix,
  TextInputType? keyboardType,
  TextEditingController? controller,
  int? maxLength,
  int? maxLines,
  bool? readOnly,
  TextCapitalization? textCapitalization,
  FocusNode? focusNode,
  Function? onSubmitted,
  TextInputAction? textInputAction,
) {
  return CupertinoTextField(
    placeholder: hint,
    placeholderStyle: TextStyle(
      color: hintColor ?? Colors.black,
    ),
    textCapitalization: TextCapitalization.none,
    padding: EdgeInsets.all(padding ?? 16.0),
    obscureText: obscureText ?? false,
    maxLength: maxLength,
    maxLines: maxLines ?? 1,
    readOnly: readOnly ?? false,
    focusNode: focusNode,
    decoration: BoxDecoration(
      color: bgColor ?? Colors.white,
      border: Border.all(color: borderColor ?? Colors.black26),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
    ),
    controller: controller,
    onChanged: onChanged as void Function(String),
    keyboardType: keyboardType,
    onSubmitted: onSubmitted as Function(String)?,
    textInputAction: textInputAction,
    suffix: Padding(
      padding: EdgeInsets.only(right: padding ?? 16.0),
      child: suffix,
    ),
  );
}
