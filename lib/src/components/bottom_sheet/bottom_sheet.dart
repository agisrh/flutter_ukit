import 'package:flutter/material.dart';

class UKitBottomSheet {
  static Future show({
    required BuildContext context,
    required Widget? content,
    Widget? trailing,
    bool enableDrag = true,
    bool floatted = false,
    double borderRadus = 20.0,
    bool hideHead = false,
    bool scroll = true,
  }) async {
    // Check if the current theme is dark or light
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: enableDrag,
      barrierColor: isDarkMode ? Colors.black.withOpacity(0.7) : Colors.white.withOpacity(0.7),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: floatted
                ? BorderRadius.circular(borderRadus)
                : BorderRadius.only(
                    topLeft: Radius.circular(borderRadus),
                    topRight: Radius.circular(borderRadus),
                  ),
            color: floatted
                ? Colors.transparent
                : isDarkMode
                    ? Colors.grey[900] // Dark background color
                    : Colors.white, // Light background color
          ),
          margin: EdgeInsets.fromLTRB(
            floatted ? 10.0 : 0.0,
            0.0,
            floatted ? 10.0 : 0.0,
            floatted ? 24.0 : 0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadus),
            child: Container(
              width: double.infinity,
              color: floatted
                  ? isDarkMode
                      ? Colors.grey[900] // Dark mode float background
                      : Colors.white // Light mode float background
                  : Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!hideHead)
                    SizedBox(
                      height: 50,
                      child: Stack(
                        children: [
                          ///
                          /// SWIPE INDICATOR
                          ///
                          Align(
                            alignment: Alignment.topCenter,
                            child: _swipeIndicator(isDarkMode),
                          ),

                          ///
                          /// TRAILING
                          ///
                          Positioned(
                            right: 0,
                            top: 0,
                            child: trailing ?? const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),

                  ///
                  /// CONTENT
                  ///
                  Container(
                    width: double.infinity,
                    padding: MediaQuery.of(context).viewInsets,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: scroll ? SingleChildScrollView(child: content) : content,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Container _swipeIndicator(bool isDarkMode) => Container(
        height: 5.0,
        width: 80.0,
        margin: const EdgeInsets.only(
          top: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isDarkMode ? Colors.white54 : Colors.black26, // Adjust swipe color based on theme
        ),
      );
}
