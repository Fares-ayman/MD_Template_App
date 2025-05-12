import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zido_community/app/core/widgets/event_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
          child: EventCard(
        image: "",
        title: "لقاء التربية في زمن صعب",
        date: "الثلاثاء 20 نوفمبر 2023",
        eventType: "نوع الفاعلية", // optional
        description:
            "وصف مختصر للفعاليةوصف مختصر للفعاليةوصف مختصر للفعاليةوصف مختصر للفعاليةوصف مختصر للفعالية", // optional
      )),
    );
  }
}
