import 'package:flutter/material.dart';
import 'package:portfolio_web_flutter/sections/contact_section.dart';
import 'about_section.dart';
import 'experience_section.dart';
import 'education_section.dart';
import 'home_section.dart';
import 'navbar.dart';
import 'projects_section.dart';
import 'skills_section.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollService.scrollController,
              child: Column(
                children: [
                  HomeSection(key: SectionKeys.home),
                  AboutSection(key: SectionKeys.about),
                  SkillsSection(key: SectionKeys.skills),
                  ExperienceSection(key: SectionKeys.experience),
                  ProjectsSection(key: SectionKeys.projects),
                  EducationSection(key: SectionKeys.education),
                  ContactSection(key: SectionKeys.contact),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionKeys {
  static final home = GlobalKey();
  static final about = GlobalKey();
  static final experience = GlobalKey();
  static final education = GlobalKey();
  static final skills = GlobalKey();
  static final projects = GlobalKey();
  static final contact = GlobalKey();
}

class ScrollService {
  static final ScrollController scrollController = ScrollController();

  static void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0.1,
    );
  }
}