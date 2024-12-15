import 'package:flutter/material.dart';
import 'dart:math';

class Utils {
  /// Converts a hex color string to a Color object
  static Color hexToColor(String hexString) {
    return _parseHexColor(hexString);
  }

  /// Converts font weight string to FontWeight enum
  static FontWeight getFontWeight(String fontWeight) {
    return _mapFontWeight(fontWeight);
  }

  /// Converts angle from degrees to radians
  static double angleToRadians(double angle) {
    return _convertToRadians(angle);
  }

  /// Internal method to parse hex color with robust handling
  static Color _parseHexColor(String hexString) {
    // Remove hash if present
    String cleanedHex = hexString.replaceAll('#', '');

    // Ensure full 8-digit hex (including alpha)
    if (cleanedHex.length == 6) {
      cleanedHex = 'FF$cleanedHex';
    }

    // Parse hex to color, defaulting to transparent if parsing fails
    try {
      return Color(int.parse(cleanedHex, radix: 16));
    } catch (e) {
      return Colors.transparent;
    }
  }

  /// Internal method to map font weight strings to FontWeight
  static FontWeight _mapFontWeight(String fontWeight) {
    switch (fontWeight) {
      case "met_semi_bold":
        return FontWeight.w600;
      case "met_regular":
        return FontWeight.w400;
      default:
        return FontWeight.w200;
    }
  }

  /// Internal method to convert degrees to radians
  static double _convertToRadians(double angle) {
    return angle * (pi / 180);
  }
}
