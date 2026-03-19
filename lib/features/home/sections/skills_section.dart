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
      skills: ['Dart', 'Python', 'SQL', 'C', 'C++'],
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
      label: 'Architecture',
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
      label: 'Tools',
      skills: ['Git', 'Figma', 'VS Code', 'Android Studio', 'Xcode'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final isMobile = ResponsiveBuilder.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.dividerColor),
          bottom: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: SectionWrapper(
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

            // Skill rows
            ..._skillGroups.asMap().entries.map((entry) {
              final i = entry.key;
              final group = entry.value;
              return FadeInWidget(
                delay: Duration(milliseconds: 150 + i * 60),
                child: _SkillRow(group: group, isMobile: isMobile),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final _SkillGroup group;
  final bool isMobile;
  const _SkillRow({required this.group, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel(mutedColor),
                    const SizedBox(height: AppSpacing.md),
                    _buildChips(theme),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left — category label
                    SizedBox(
                      width: 180,
                      child: _buildLabel(mutedColor),
                    ),
                    const SizedBox(width: AppSpacing.xl),
                    // Right — chips
                    Expanded(child: _buildChips(theme)),
                  ],
                ),
        ),
        Divider(color: theme.dividerColor, height: 0.5, thickness: 0.5),
      ],
    );
  }

  Widget _buildLabel(Color mutedColor) {
    return Text(
      group.label.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: mutedColor,
      ),
    );
  }

  Widget _buildChips(ThemeData theme) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: group.skills
          .map((skill) => _SkillChip(label: skill))
          .toList(),
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
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs + 2,
        ),
        decoration: BoxDecoration(
          color: _hovered
              ? theme.colorScheme.primary
              : isDark
                  ? Color(0xFF1E1D2E)
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _hovered
                ? Colors.white
                : theme.colorScheme.primary,
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