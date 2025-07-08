import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A placeholder implementation of the Figma mobile landing page.
/// At this stage it only renders the background color and a centered CTA
/// to serve as a compile-ready starting point for further TDD iterations.
class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE5DB),
      body: Center(
        child: Text(
          'join waitlist',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
} 