import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_builder.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _skills = [
    'Flutter', 'Dart', 'BLoC','GetX', 'Firebase', 'Razorpay', 'Supabase',
    'REST APIs', 'Git', 'Clean Arch', 'UI/UX','Figma',
    'Go Router', 'Hive', 'SQLite', 'CI/CD',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBuilder.isMobile(context);
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha:0.55);

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
                '01. About',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            if (isMobile)
              _buildMobileLayout(context, textColor, mutedColor)
            else
              _buildDesktopLayout(context, textColor, mutedColor),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
      BuildContext context, Color textColor, Color mutedColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildProfileImage(context)),
        const SizedBox(width: 64),
        Expanded(
          flex: 2,
          child: _buildAboutText(context, textColor, mutedColor),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
      BuildContext context, Color textColor, Color mutedColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileImage(context),
        const SizedBox(height: AppSpacing.xl),
        _buildAboutText(context, textColor, mutedColor),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return FadeInWidget(
      delay: const Duration(milliseconds: 100),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/profile_pic.jpeg',
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 64,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText(
      BuildContext context, Color textColor, Color mutedColor) {
    Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInWidget(
          delay: const Duration(milliseconds: 150),
          child: Text(
            'Building apps people love.',
            style: AppTextStyles.headlineLarge(textColor),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        FadeInWidget(
          delay: const Duration(milliseconds: 200),
          child: Text(
            "I'm a Flutter developer based in Kerala, India. I specialise in crafting smooth, pixel-perfect mobile and web apps with a strong focus on clean architecture and maintainable code.",
            style: AppTextStyles.bodyMedium(mutedColor),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        FadeInWidget(
          delay: const Duration(milliseconds: 250),
          child: Text(
            "When I'm not coding, you'll find me exploring new design patterns, contributing to open source, or sketching out the next app idea.",
            style: AppTextStyles.bodyMedium(mutedColor),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        FadeInWidget(
          delay: const Duration(milliseconds: 300),
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _skills
                .map((skill) => _SkillChip(label: skill))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs + 2),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E1D2E)
            : const Color(0xFFEEEDFE),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}