import 'package:flutter/material.dart';

class ScrollService {
  static void scrollToSection(GlobalKey key, ScrollController controller) {
    final context = key.currentContext;
    if (context == null) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    final offset = box.localToGlobal(Offset.zero, ancestor: null).dy +
        controller.offset - 80; // 80 = header height offset
    controller.animateTo(
      offset.clamp(0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }
}