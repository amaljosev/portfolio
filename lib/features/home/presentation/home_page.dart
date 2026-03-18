import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/home/sections/about_section.dart';
import 'package:portfolio/features/home/sections/apps_section.dart';
import 'package:portfolio/features/home/sections/contact_section.dart';
import 'package:portfolio/features/home/sections/experience_section.dart';
import 'package:portfolio/features/home/sections/header_section.dart';
import 'package:portfolio/features/home/sections/landing_section.dart';
import '../../../core/theme/bloc/theme_bloc.dart';
import '../../../core/utils/scroll_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _landingKey   = GlobalKey();
  final GlobalKey _aboutKey     = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _appsKey      = GlobalKey();
  final GlobalKey _contactKey   = GlobalKey();

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
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 72), // header clearance
                LandingSection(
                  key: _landingKey,
                  onViewApps: () => _scrollTo(_appsKey),
                  onContact: () => _scrollTo(_contactKey),
                ),
                AboutSection(key: _aboutKey),
                ExperienceSection(key: _experienceKey),
                AppsSection(key: _appsKey),
                ContactSection(key: _contactKey),
              ],
            ),
          ),

          // Fixed Header
          Positioned(
            top: 0, left: 0, right: 0,
            child: HeaderSection(
              isDark: isDark,
              onThemeToggle: () =>
                  context.read<ThemeBloc>().add(ToggleThemeEvent()),
              onAbout:      () => _scrollTo(_aboutKey),
              onExperience: () => _scrollTo(_experienceKey),
              onApps:       () => _scrollTo(_appsKey),
              onContact:    () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }

}