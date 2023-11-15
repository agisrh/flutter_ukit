import 'dart:ui';
import 'models/ukit_builder.dart';

class UKitUtils {
  /// Get Double
  /// returns a [double] based on [UIDefaults] or overridden properties
  static double getDouble(UKitBuilder? defaults, double? defaultProp,
      double? overrideWith, double defaultTo) {
    /// if defaults is defined
    if (defaults != null) {
      ///
      /// Check if an override property is set
      /// if so, use it
      if (overrideWith != null) return overrideWith;

      /// if the current prop is not set in [UIDefaults]
      /// use override prop or a default one
      if (defaultProp == null) {
        return overrideWith ?? defaultTo;
      }

      /// If the passed default prop is set, use it.
      return defaultProp;
    }

    /// if defaults is null
    /// try to set [overrideWith] orhterwuse defaults to [defaultTo]
    return overrideWith ?? defaultTo;
  }

  /// Get Color
  /// returns a [Color] based on [UIDefaults] or overridden properties
  static Color getColor(UKitBuilder? defaults, Color? defaultProp,
      Color? overrideWith, Color defaultTo) {
    /// if defaults is defined
    if (defaults != null) {
      ///
      /// Check if an override property is set
      /// if so, use it
      if (overrideWith != null) return overrideWith;

      /// if the current prop is not set in [UIDefaults]
      /// use override prop or a default one
      if (defaultProp == null) {
        return overrideWith ?? defaultTo;
      }

      /// If the passed default prop is set, use it.
      return defaultProp;
    }

    /// if defaults is null
    /// try to set [overrideWith] orhterwuse defaults to [defaultTo]
    return overrideWith ?? defaultTo;
  }

  /// Get Whatever
  /// returns a [dynamic] based on [UIDefaults] or overridden properties
  static dynamic getStyle(UKitBuilder? defaults, dynamic defaultProp,
      dynamic overrideWith, dynamic defaultTo) {
    /// if defaults is defined
    if (defaults != null) {
      ///
      /// Check if an override property is set
      /// if so, use it
      if (overrideWith != null) return overrideWith;

      /// if the current prop is not set in [UIDefaults]
      /// use override prop or a default one
      if (defaultProp == null) {
        return overrideWith ?? defaultTo;
      }

      /// If the passed default prop is set, use it.
      return defaultProp;
    }

    /// if defaults is null
    /// try to set [overrideWith] orhterwuse defaults to [defaultTo]
    return overrideWith ?? defaultTo;
  }
}

// Border Type
enum UKitBorderType { outlineBorder, underlineBorder }
