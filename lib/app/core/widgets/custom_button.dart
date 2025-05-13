import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isDisabled;
  final bool hasBorder;
  final Color? textColor;

  const CustomButton({
    required Key key,
    this.height,
    this.width,
    required this.text,
    this.onPressed,
    this.color,
    this.isDisabled = false,
    this.hasBorder = false,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.disabledPrimaryColor,
          backgroundColor: (color ?? AppColors.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: hasBorder
                ? const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  )
                : BorderSide.none,
          ),
          minimumSize: Size(width ?? double.infinity, 0),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
          ),
          textDirection: TextDirection.rtl, // For Arabic support
          minFontSize: 12,
          maxFontSize: 16,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
