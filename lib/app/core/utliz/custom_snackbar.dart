import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';
import '../values/app_text_style.dart';

void showCustomSnackBar({
  required String title,
  String? message,
  bool isError = true,
}) {
  Get.snackbar(
    "",
    "",
    maxWidth: Get.width * 0.95,
    titleText: AutoSizeText(
      title,
      style: AppTextStyles.latoBold18.copyWith(
        color: Colors.white,
      ),
    ),
    messageText: message != null
        ? AutoSizeText(
            message,
            style: AppTextStyles.latoBold16.copyWith(
              color: Colors.white,
            ),
          )
        : null,
    margin: const EdgeInsets.only(
      bottom: 12,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 24,
    ),
    backgroundColor: isError ? AppColors.errorRed : AppColors.greenTextColor,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    icon: Icon(
      isError ? Icons.error_outline_rounded : Icons.check,
      color: Colors.white,
      size: 36,
    ),
  );
}
