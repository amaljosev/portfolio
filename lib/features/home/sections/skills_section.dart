import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_builder.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skillGroups = [
    _SkillGroup(
      label: 'Languages',
      skills: ['Dart', 'Python', 'SQL','C','C++'],
    ),
    _SkillGroup(
      label: 'Platforms',
      skills: ['Android', 'iOS', 'Web'],
    ),
    _SkillGroup(
      label: 'Framework & State',
      skills: ['Flutter', 'BLoC', 'GetX', 'Provider', 'Riverpod'],
    ),
    _SkillGroup(
      label: 'Architecture & Patterns',
      skills: ['Clean Architecture', 'MVC', 'OOP', 'Functional Programming', 'Error Handling'],
    ),
    _SkillGroup(
      label: 'Databases & Backend',
      skills: ['Firebase', 'Hive', 'SQLite', 'Supabase', 'REST APIs'],
    ),
    _SkillGroup(
      label: 'Expertise',
      skills: ['Flutter Animations', 'Local Notifications', 'Play Store', 'App Store', 'UI/UX'],
    ),
    _SkillGroup(
      label: 'Tools & Design',
      skills: ['Git', 'Figma', 'VS Code', 'Android Studio', 'Xcode'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final isMobile = ResponsiveBuilder.isMobile(context);
    final isTablet = ResponsiveBuilder.isTablet(context);
    final columns = isMobile ? 1 : isTablet ? 2 : 3;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInWidget(
            child: Text(
              '02. Skills',
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
              'What I work with.',
              style: AppTextStyles.headlineLarge(textColor),
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),

          // Grid of skill groups
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.lg,
              mainAxisSpacing: AppSpacing.lg,
              childAspectRatio: isMobile ? 2.5 : 1.7,
            ),
            itemCount: _skillGroups.length,
            itemBuilder: (context, i) => FadeInWidget(
              delay: Duration(milliseconds: 150 + i * 80),
              child: _SkillGroupCard(group: _skillGroups[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  final _SkillGroup group;
  const _SkillGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category label
          Row(
            children: [
              Container(
                width: 3,
                height: 14,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                group.label.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: mutedColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Chips
          Expanded(
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: group.skills
                  .map((skill) => _SkillChip(label: skill))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm + 2,
          vertical: AppSpacing.xs + 1,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? theme.colorScheme.primary
              : isDark
                  ? const Color(0xFF1E1A10)
                  : const Color(0xFFF5EDD6),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: _hovered
                ? theme.colorScheme.primary
                : theme.dividerColor,
            width: 0.5,
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _hovered ? Colors.white : theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _SkillGroup {
  final String label;
  final List<String> skills;
  const _SkillGroup({required this.label, required this.skills});
}