import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
  _Experience(
    company: 'Solutions Infoway Support Services Pvt.Ltd',
    role: 'Mobile App Developer',
    duration: 'May 2024 – Present',
    description:
        'Flutter Developer responsible for end-to-end mobile development across Android and iOS. Contributed to planning, built and maintained the full frontend, integrated backend APIs, implemented complex state management, and managed app deployment and updates on Play Store and App Store.',
    tags: ['Flutter', 'BLoC', 'Razorpay', 'REST API','Play Store & App Store Management'],
  ),
];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInWidget(
            child: Text(
              '03. Experience',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FadeInWidget(
            delay: const Duration(milliseconds: 100),
            child: Text(
              "Where I've worked.",
              style: AppTextStyles.headlineLarge(textColor),
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          ..._experiences.asMap().entries.map((e) => FadeInWidget(
                delay: Duration(milliseconds: 150 + e.key * 100),
                child: _ExperienceItem(experience: e.value),
              )),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final _Experience experience;
  const _ExperienceItem({required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile =
        MediaQuery.of(context).size.width < 600;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha:0.55);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor)),
      ),
      child: isMobile
          ? _buildMobile(theme, textColor, mutedColor)
          : _buildDesktop(theme, textColor, mutedColor),
    );
  }

  Widget _buildDesktop(
      ThemeData theme, Color textColor, Color mutedColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          child: _buildLeft(theme, mutedColor),
        ),
        const SizedBox(width: AppSpacing.xl),
        Expanded(child: _buildRight(theme, textColor, mutedColor)),
      ],
    );
  }

  Widget _buildMobile(
      ThemeData theme, Color textColor, Color mutedColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeft(theme, mutedColor),
        const SizedBox(height: AppSpacing.md),
        _buildRight(theme, textColor, mutedColor),
      ],
    );
  }

  Widget _buildLeft(ThemeData theme, Color mutedColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.company,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          experience.duration,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: mutedColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRight(
      ThemeData theme, Color textColor, Color mutedColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.role,
          style: AppTextStyles.titleLarge(textColor),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          experience.description,
          style: AppTextStyles.bodySmall(mutedColor),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: experience.tags
              .map((tag) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.dividerColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: mutedColor,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _Experience {
  final String company;
  final String role;
  final String duration;
  final String description;
  final List<String> tags;
  const _Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    required this.tags,
  });
}