import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/home/sections/about_section.dart';
import 'package:portfolio/features/home/sections/apps_section.dart';
import 'package:portfolio/features/home/sections/contact_section.dart';
import 'package:portfolio/features/home/sections/experience_section.dart';
import 'package:portfolio/features/home/sections/header_section.dart';
import 'package:portfolio/features/home/sections/landing_section.dart';
import 'package:portfolio/features/home/sections/skills_section.dart';
import '../../../core/theme/bloc/theme_bloc.dart';
import '../../../core/utils/scroll_service.dart';

class _SmoothScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return Scrollbar(
      controller: details.controller,
      thumbVisibility: false,
      child: child,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _landingKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    ScrollService.scrollToSection(key, _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeBloc>().state.isDark;

    return Scaffold(
      body: ScrollConfiguration(
        behavior: _SmoothScrollBehavior(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Fixed header as sliver
            SliverPersistentHeader(
              pinned: true,

              delegate: _HeaderDelegate(
                child: HeaderSection(
                  isDark: isDark,
                  onThemeToggle: () =>
                      context.read<ThemeBloc>().add(ToggleThemeEvent()),
                  onAbout: () => _scrollTo(_aboutKey),
                  onSkills: () => _scrollTo(_skillsKey),
                  onExperience: () => _scrollTo(_experienceKey),
                  onApps: () => _scrollTo(_appsKey),
                  onContact: () => _scrollTo(_contactKey),
                ),
              ),
            ),

            // All sections as a single sliver
            SliverToBoxAdapter(
              child: Column(
                children: [
                  LandingSection(
                    key: _landingKey,
                    onViewApps: () => _scrollTo(_appsKey),
                    onContact: () => _scrollTo(_contactKey),
                  ),
                  AboutSection(key: _aboutKey),
                  SkillsSection(key: _skillsKey),
                  ExperienceSection(key: _experienceKey),
                  AppsSection(key: _appsKey),
                  ContactSection(key: _contactKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  const _HeaderDelegate({required this.child});

  @override
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) => oldDelegate.child != child;
}
