import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/waitlist_viewmodel.dart';
import '../../widgets/animated_waitlist_button.dart';

/// A placeholder implementation of the Figma mobile landing page.
/// At this stage it only renders the background color and a centered CTA
/// to serve as a compile-ready starting point for further TDD iterations.
class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE5DB),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Semi-transparent overlay
          Container(
            color: const Color(0xFFF7E9DC).withOpacity(0.33),
          ),
          
          // Content
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 393,
                height: 852,
                child: Stack(
                  children: [
                    // Top row images
                    Positioned(
                      left: 8,
                      top: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 7.png',
                          width: 218,
                          height: 172,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 233,
                      top: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 8.png',
                          width: 150,
                          height: 158,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Middle row images
                    Positioned(
                      left: 23,
                      top: 186,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 3.png',
                          width: 184,
                          height: 231,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 179,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 6.png',
                          width: 140,
                          height: 177,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Lower middle row images
                    Positioned(
                      left: 8,
                      top: 426,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 2.png',
                          width: 199,
                          height: 129,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 363,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 1.png',
                          width: 158,
                          height: 184,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Bottom row images
                    Positioned(
                      left: 8,
                      top: 564,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 4.png',
                          width: 163,
                          height: 233,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 200,
                      top: 551,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/image 5.png',
                          width: 183,
                          height: 283,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Add overlay above images but below text boxes
                    Container(
                      width: 393,
                      height: 852,
                      color: const Color(0xFFEFE5DB).withOpacity(0.50),
                    ),
                    
                    // Header text card
                    Positioned(
                      left: 38,
                      top: 105,
                      child: Container(
                        width: 318.89,
                        height: 125,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFE5DB), 
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(2, 4),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: Text(
                              "Moms spend all their time listening and caring for others, but who listens and cares for them?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Waitlist CTA card
                    Positioned(
                      left: 70,
                      top: 519,
                      child: Container(
                        width: 260,
                        height: 250,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFE5DB),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 23.9,
                            ),
                          ],
                        ),
                        child: Stack(  // Changed from Column to Stack
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 32, left: 23, right: 23),
                              child: Text(
                                "We built a space that connects you with moms who've been in your shoes and understand exactly what you're going through.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              left: (260 - 158.64) / 2, // Center horizontally
                              bottom: 55, // Positioned from bottom
                              child: Consumer<WaitlistViewModel>(
                                builder: (context, viewModel, _) {
                                  return AnimatedWaitlistButton(
                                    onTap: (email) => viewModel.joinWaitlist(email),
                                    label: 'join waitlist ❤️',
                                    isLoading: viewModel.state == WaitlistState.loading,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 