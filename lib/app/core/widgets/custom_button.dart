import 'package:flutter/material.dart';
import '../values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isDisabled;

  const CustomButton({
    required Key key,
    this.height,
    this.width,
    required this.text,
    this.onPressed,
    this.color,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.disablemainButtonColor,
          backgroundColor: (color ?? AppColors.mainButtonColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          minimumSize: Size(width ?? double.infinity, height ?? 56),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textDirection: TextDirection.rtl, // For Arabic support
        ),
      ),
    );
  }
}
