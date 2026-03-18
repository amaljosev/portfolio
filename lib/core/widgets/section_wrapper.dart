import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SectionWrapper({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontal = screenWidth < 600
        ? AppSpacing.md
        : screenWidth < 1024
            ? AppSpacing.xl
            : AppSpacing.xxxl;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppSpacing.maxContentWidth,
        ),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: AppSpacing.sectionPaddingV,
              ),
          child: child,
        ),
      ),
    );
  }
}