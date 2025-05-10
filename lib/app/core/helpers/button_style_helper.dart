import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';

class ButtonStyleHelper{
  static ButtonStyle buildButtonStyle({required Color backgroundColor, Color? borderColor,double? elevation, double radius=8}) {
    return ButtonStyle(
      elevation: WidgetStateProperty.all<double?>(elevation),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lightGray;
          }
          return backgroundColor;
        },
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          horizontal: 6.w,
        ),
      ),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: AppColors.lightGray,
              ),
              borderRadius: BorderRadius.circular(radius),
            );
          }
          return RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: borderColor ?? backgroundColor,
            ),
            borderRadius: BorderRadius.circular(radius),
          );
        },
      ),
    );
  }
}