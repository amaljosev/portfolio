import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_builder.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class LandingSection extends StatelessWidget {
  final VoidCallback onViewApps;
  final VoidCallback onContact;

  const LandingSection({
    super.key,
    required this.onViewApps,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBuilder.isMobile(context);
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = theme.colorScheme.onSurface.withOpacity(0.55);

    return SectionWrapper(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.md : AppSpacing.xxxl,
        vertical: isMobile ? AppSpacing.xxxl : 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInWidget(
            child: Row(
              children: [
                Container(
                  width: 32, height: 1,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  "Hi, I'm",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FadeInWidget(
            delay: const Duration(milliseconds: 100),
            child: Text(
              '${AppConstants.name}.',
              style: AppTextStyles.displayLarge(textColor).copyWith(
                fontSize: isMobile ? 42 : 68,
              ),
            ),
          ),
          FadeInWidget(
            delay: const Duration(milliseconds: 200),
            child: Text(
              AppConstants.role,
              style: AppTextStyles.displayMedium(mutedColor).copyWith(
                fontSize: isMobile ? 28 : 48,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FadeInWidget(
            delay: const Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Text(
                AppConstants.tagline,
                style: AppTextStyles.bodyLarge(mutedColor),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          FadeInWidget(
            delay: const Duration(milliseconds: 400),
            child: Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                _PrimaryButton(
                  label: 'View my apps',
                  onTap: onViewApps,
                ),
                _OutlineButton(
                  label: 'Get in touch',
                  onTap: onContact,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          FadeInWidget(
            delay: const Duration(milliseconds: 500),
            child: Row(
              children: [
                Container(width: 40, height: 1, color: theme.dividerColor),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Scroll to explore',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: mutedColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.onTap});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: 14),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(_hovered ? 0.85 : 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlineButton({required this.label, required this.onTap});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? theme.colorScheme.primary
                  : theme.dividerColor,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: _hovered
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}