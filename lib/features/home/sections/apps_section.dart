import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_helper.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  static const _apps = [
    _App(
      name: 'Pursuit',
      description:
          'A production-ready habit tracker built with Clean Architecture, SQLite, and FL Chart. Features streak tracking, partial progress logging, and local notifications.',
      image: 'assets/images/pursuit_icon.webp',
      playStoreUrl: AppConstants.pursuitAppLink,
      githubUrl: AppConstants.pursuitGitLink,
    ),
    _App(
      name: 'Routine',
      description:
          'Full-featured productivity app with an interactive diary, gesture-based sticker overlays, Supabase integration, and offline-first SQLite storage.',
      image: 'assets/images/routine_icon.webp',
      playStoreUrl: AppConstants.routineAppLink,
      githubUrl: AppConstants.routineGitLink,
    ),
    
    _App(
      name: 'Ddata App',
      description:
          'Feature-rich platform for digital business cards, brand coupons, and web tools — built with Flutter, BLoC, and REST APIs. Structured with MVC architecture for clean separation of concerns.',
      image: 'assets/images/ddata_icon.webp',
      playStoreUrl: AppConstants.ddataPlayStoreLink,
      appStoreUrl: AppConstants.ddataAppStoreLink,
    ),
    _App(
      name: 'Edu Plan',
      description:
          'School management platform live on Amazon App Store. Built with BLoC, Firebase real-time chat, and Razorpay payment gateway.',
      image: 'assets/images/eduplan_icon.webp',
      amazonStoreUrl: AppConstants.eduPlanAppLink,
      githubUrl: AppConstants.eduPlanGitLink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = screenWidth < 600
        ? 1
        : screenWidth < 1024
        ? 2
        : 3;

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
                '03. My apps',
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
                "Things I've built.",
                style: AppTextStyles.headlineLarge(textColor),
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              children: _apps.asMap().entries.map((e) {
                final cardWidth = columns == 1
                    ? double.infinity
                    : (MediaQuery.of(context).size.width -
                              AppSpacing.xxxl * 2 -
                              AppSpacing.lg * (columns - 1)) /
                          columns;
                return FadeInWidget(
                  delay: Duration(milliseconds: 150 + e.key * 100),
                  child: SizedBox(
                    width: columns == 1
                        ? double.infinity
                        : cardWidth.clamp(200, 400),
                    child: _AppCard(app: e.value),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppCard extends StatefulWidget {
  final _App app;
  const _AppCard({required this.app});

  @override
  State<_AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<_AppCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutedColor = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? theme.colorScheme.primary : theme.dividerColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: _hovered
                          ? [
                              BoxShadow(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.4,
                                ),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                              BoxShadow(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.2,
                                ),
                                blurRadius: 40,
                                spreadRadius: 6,
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.0,
                                ),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          widget.app.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: theme.dividerColor),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.phone_iphone_rounded,
                                size: 32,
                                color: theme.dividerColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                // App name
                Text(
                  widget.app.name,
                  style: AppTextStyles.titleLarge(theme.colorScheme.onSurface),
                ),
                const SizedBox(height: AppSpacing.xs),
                // Description — expands on hover
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: _hovered
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: Text(
                    widget.app.description,
                    style: AppTextStyles.bodySmall(mutedColor),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  secondChild: Text(
                    widget.app.description,
                    style: AppTextStyles.bodySmall(mutedColor),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                // Buttons — only renders if url is provided
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    if (widget.app.playStoreUrl != null)
                      _AppLinkButton(
                        label: 'Play Store',
                        onTap: () =>
                            UrlHelper.openUrl(widget.app.playStoreUrl!),
                      ),
                    if (widget.app.appStoreUrl != null)
                      _AppLinkButton(
                        label: 'App Store',
                        onTap: () => UrlHelper.openUrl(widget.app.appStoreUrl!),
                      ),
                    if (widget.app.amazonStoreUrl != null)
                      _AppLinkButton(
                        label: 'Amazon Store',
                        onTap: () =>
                            UrlHelper.openUrl(widget.app.amazonStoreUrl!),
                      ),
                    if (widget.app.githubUrl != null)
                      _AppLinkButton(
                        label: 'GitHub',
                        onTap: () => UrlHelper.openUrl(widget.app.githubUrl!),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppLinkButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _AppLinkButton({required this.label, required this.onTap});

  @override
  State<_AppLinkButton> createState() => _AppLinkButtonState();
}

class _AppLinkButtonState extends State<_AppLinkButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: _hovered ? theme.colorScheme.primary : theme.dividerColor,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _hovered
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }
}

class _App {
  final String name;
  final String description;
  final String image;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? amazonStoreUrl;
  final String? githubUrl;

  const _App({
    required this.name,
    required this.description,
    required this.image,
    this.playStoreUrl,
    this.appStoreUrl,
    this.amazonStoreUrl,
    this.githubUrl,
  });
}
