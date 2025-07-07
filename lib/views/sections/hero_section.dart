import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onJoinWaitlist;

  const HeroSection({
    super.key,
    required this.onJoinWaitlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFE91E63).withOpacity(0.1),
            const Color(0xFFF8BBD9).withOpacity(0.1),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Hero Content
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              children: [
                // Left side - Text content
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect with Moms\nWho Understand',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D3748),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Join a community where mothers support each other through the real challenges of motherhood. Find your tribe, share your journey, and grow together.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          color: const Color(0xFF4A5568),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // CTA Buttons
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: onJoinWaitlist,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE91E63),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Join the Waitlist',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () {
                              // Scroll to about section
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFFE91E63),
                              side: const BorderSide(color: Color(0xFFE91E63)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Learn More',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Right side - Hero image/illustration
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE91E63).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 80,
                          color: const Color(0xFFE91E63),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Moms Supporting Moms',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: const Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
} 