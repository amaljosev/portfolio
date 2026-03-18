import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_helper.dart';
import '../../../../core/widgets/fade_in_widget.dart';
import '../../../../core/widgets/section_wrapper.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  static const _apps = [
    _App(
      name: 'Fintrack',
      description:
          'Personal finance tracker with beautiful charts, budgeting tools, and bank sync.',
      image: 'assets/images/app_fintrack.png',
      playStoreUrl: 'https://play.google.com',
      githubUrl: 'https://github.com',
    ),
    _App(
      name: 'Mealio',
      description:
          'Food delivery app with real-time order tracking and restaurant discovery.',
      image: 'assets/images/app_mealio.png',
      playStoreUrl: 'https://play.google.com',
      githubUrl: 'https://github.com',
    ),
    _App(
      name: 'Fitpulse',
      description:
          'Workout planner and health tracker with animated exercise guides.',
      image: 'assets/images/app_fitpulse.png',
      playStoreUrl: 'https://play.google.com',
      githubUrl: 'https://github.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = screenWidth < 600 ? 1 : screenWidth < 1024 ? 2 : 3;

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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: AppSpacing.lg,
                mainAxisSpacing: AppSpacing.lg,
                childAspectRatio: 0.85,
              ),
              itemCount: _apps.length,
              itemBuilder: (context, i) => FadeInWidget(
                delay: Duration(milliseconds: 150 + i * 100),
                child: _AppCard(app: _apps[i]),
              ),
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
    final mutedColor = theme.colorScheme.onSurface.withOpacity(0.55);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? theme.colorScheme.primary
                : theme.dividerColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App image
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.app.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.scaffoldBackgroundColor,
                    child: Center(
                      child: Icon(
                        Icons.phone_iphone_rounded,
                        size: 40,
                        color: theme.dividerColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // App info
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.app.name,
                    style: AppTextStyles.titleLarge(
                        theme.colorScheme.onSurface),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    widget.app.description,
                    style: AppTextStyles.bodySmall(mutedColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      _AppLinkButton(
                        label: 'Play Store',
                        onTap: () =>
                            UrlHelper.openUrl(widget.app.playStoreUrl),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _AppLinkButton(
                        label: 'GitHub',
                        onTap: () =>
                            UrlHelper.openUrl(widget.app.githubUrl),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
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
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _hovered
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.7),
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
  final String playStoreUrl;
  final String githubUrl;
  const _App({
    required this.name,
    required this.description,
    required this.image,
    required this.playStoreUrl,
    required this.githubUrl,
  });
}