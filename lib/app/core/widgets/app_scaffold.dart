import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3A4FA5), // #3A4FA5
                    Color(0xFF161E3F), // #161E3F
                  ],
                ),
              ),
              child: const Text('Hello'),
            ),
          ),
          Container(
            height: 800.h,
            child: const Text('Hello'),
          ),
        ],
      ),
    );
  }
}
