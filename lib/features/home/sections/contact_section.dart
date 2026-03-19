import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_helper.dart';
import '../../../../core/widgets/fade_in_widget.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Container(
      color: theme.cardColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.xxxl,
              right: AppSpacing.xxxl,
              top: AppSpacing.sectionPaddingV,
              bottom: AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInWidget(
                  child: Text(
                    '05. Contact',
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
                    "Let's work together.",
                    style: AppTextStyles.headlineLarge(textColor),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                FadeInWidget(
                  delay: const Duration(milliseconds: 150),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Text(
                      'Have a project in mind or just want to say hi? My inbox is always open.',
                      style: AppTextStyles.bodyMedium(mutedColor),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                FadeInWidget(
                  delay: const Duration(milliseconds: 200),
                  child: Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: [
                      _ContactLink(
                        icon: Icons.email_outlined,
                        label: AppConstants.email,
                        onTap: () => UrlHelper.sendEmail(AppConstants.email),
                      ),
                      _ContactLink(
                        icon: Icons.code_rounded,
                        label: 'GitHub',
                        onTap: () => UrlHelper.openUrl(AppConstants.github),
                      ),
                      _ContactLink(
                        icon: Icons.work_outline_rounded,
                        label: 'LinkedIn',
                        onTap: () => UrlHelper.openUrl(AppConstants.linkedin),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xxxl),
                FadeInWidget(
                  delay: const Duration(milliseconds: 250),
                  child: Divider(color: theme.dividerColor),
                ),
                const SizedBox(height: AppSpacing.sm),
                FadeInWidget(
                  delay: const Duration(milliseconds: 300),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 600;
                      if (isMobile) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '© 2026 ${AppConstants.name}. All rights reserved.',
                              style: AppTextStyles.bodySmall(mutedColor),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _PulsingDot(color: theme.colorScheme.primary),
                                const SizedBox(width: 6),
                                Text(
                                  'Available for freelance',
                                  style: AppTextStyles.bodySmall(mutedColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Built with ',
                                  style: AppTextStyles.bodySmall(mutedColor),
                                ),
                                Text(
                                  'Flutter',
                                  style: AppTextStyles.bodySmall(
                                    theme.colorScheme.primary,
                                  ).copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '© 2026 ${AppConstants.name}. All rights reserved.',
                            style: AppTextStyles.bodySmall(mutedColor),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Built with ',
                                style: AppTextStyles.bodySmall(mutedColor),
                              ),
                              Text(
                                'Flutter',
                                style: AppTextStyles.bodySmall(
                                  theme.colorScheme.primary,
                                ).copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          // Right — Available for freelance
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _PulsingDot(color: theme.colorScheme.primary),
                              const SizedBox(width: 6),
                              Text(
                                'Available for freelance',
                                style: AppTextStyles.bodySmall(mutedColor),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? theme.colorScheme.primary : theme.dividerColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: _hovered
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _hovered
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  final Color color;
  const _PulsingDot({required this.color});

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _anim = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
      ),
    );
  }
}
