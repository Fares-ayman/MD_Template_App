import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zido_community/gen/assets.gen.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.bodyHeight,
  });

  final String? title;
  final double? bodyHeight;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final bodyFinalHeight = bodyHeight ?? 700.h;
    final topWidgetHeight = Get.height - bodyFinalHeight + 30.h;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: Get.width,
              height: topWidgetHeight,
              child: Stack(
                children: [
                  Assets.images.blueBackground.svg(
                    width: Get.width,
                    height: topWidgetHeight,
                  ),
                  if (title != null)
                    Text(
                      title!,
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: bodyFinalHeight,
              width: Get.width,
              child: body,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
