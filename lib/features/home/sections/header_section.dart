import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_builder.dart';

class HeaderSection extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onApps;
  final VoidCallback onContact;

  const HeaderSection({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onApps,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveBuilder.isMobile(context);

    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                // Logo
                Text(
                  AppConstants.name.split(' ').first,
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.primary,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  '.',
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: isDark
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                    letterSpacing: -0.5,
                  ),
                ),
                const Spacer(),

                // Nav links (desktop only)
                if (!isMobile) ...[
                  _NavLink(label: 'About', onTap: onAbout),
                  _NavLink(label: 'Skills', onTap: onSkills),
                  _NavLink(label: 'Experience', onTap: onExperience),
                  _NavLink(label: 'Apps', onTap: onApps),
                  _NavLink(label: 'Contact', onTap: onContact),
                  const SizedBox(width: AppSpacing.md),
                ],

                // Theme toggle
                GestureDetector(
                  onTap: onThemeToggle,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isDark ? '☀️' : '🌙',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),

                // Mobile menu button
                if (isMobile) ...[
                  const SizedBox(width: AppSpacing.md),
                  _MobileMenu(
                    onAbout: onAbout,
                    onSkills: onSkills,
                    onExperience: onExperience,
                    onApps: onApps,
                    onContact: onContact,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _hovered
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.55),
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onApps;
  final VoidCallback onContact;

  const _MobileMenu({
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onApps,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.menu_rounded,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onSelected: (value) {
        switch (value) {
          case 'about':
            onAbout();
            break;
          case 'skills':
            onSkills();
            break;
          case 'experience':
            onExperience();
            break;
          case 'apps':
            onApps();
            break;
          case 'contact':
            onContact();
            break;
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'about', child: Text('About')),
        PopupMenuItem(value: 'skills', child: Text('Skills')),
        PopupMenuItem(value: 'experience', child: Text('Experience')),
        PopupMenuItem(value: 'apps', child: Text('Apps')),
        PopupMenuItem(value: 'contact', child: Text('Contact')),
      ],
    );
  }
}
