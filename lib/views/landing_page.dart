import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moms_bond/viewmodels/app_viewmodel.dart';
import 'package:moms_bond/views/sections/hero_section.dart';
import 'package:moms_bond/views/sections/about_section.dart';
import 'package:moms_bond/views/sections/mission_section.dart';
import 'package:moms_bond/views/sections/contact_section.dart';
import 'package:moms_bond/views/sections/waitlist_section.dart';
import 'package:moms_bond/views/widgets/footer_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppViewModel>().loadWaitlistStats();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionId) {
    // This would be implemented with actual scroll logic
    // For now, we'll just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Scrolling to $sectionId section'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('MomsBond'),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFFE91E63),
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HeroSection(onJoinWaitlist: () => _scrollToSection('waitlist')),
                AboutSection(),
                MissionSection(),
                ContactSection(),
                WaitlistSection(),
                FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 