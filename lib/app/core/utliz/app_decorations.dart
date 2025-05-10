import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class AppDecorations {
  static OutlineInputBorder defaultBorder({
    double borderWidth = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.lightGray,
        width: borderWidth,
      ),
    );
  }

  static OutlineInputBorder focusedBorder(
      {double borderWidth = 1.0, bool searchField = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(searchField ? 100 : 8),
      borderSide: BorderSide(
        color: AppColors.darkBlue,
        width: borderWidth,
      ),
    );
  }

  static OutlineInputBorder errorBorder({
    double borderWidth = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.errorRed,
        width: borderWidth,
      ),
    );
  }
}
