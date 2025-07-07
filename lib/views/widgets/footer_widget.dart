import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      color: const Color(0xFF2D3748),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Footer Content
                Row(
                  children: [
                    // Company Info
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MomsBond',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Connecting mothers, building bonds, supporting each other through the beautiful journey of motherhood.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Social Links
                          Row(
                            children: [
                              _SocialLink(
                                icon: Icons.facebook,
                                onTap: () {
                                  // Handle Facebook link
                                },
                              ),
                              const SizedBox(width: 16),
                              _SocialLink(
                                icon: Icons.camera_alt,
                                onTap: () {
                                  // Handle Instagram link
                                },
                              ),
                              const SizedBox(width: 16),
                              _SocialLink(
                                icon: Icons.flutter_dash,
                                onTap: () {
                                  // Handle Twitter link
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 60),
                    
                    // Quick Links
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Links',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FooterLink(text: 'About Us', onTap: () {}),
                          _FooterLink(text: 'Our Mission', onTap: () {}),
                          _FooterLink(text: 'Contact', onTap: () {}),
                          _FooterLink(text: 'Join Waitlist', onTap: () {}),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 40),
                    
                    // Support Links
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _FooterLink(text: 'Privacy Policy', onTap: () {}),
                          _FooterLink(text: 'Terms of Service', onTap: () {}),
                          _FooterLink(text: 'FAQ', onTap: () {}),
                          _FooterLink(text: 'Help Center', onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Footer Bottom
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© 2024 MomsBond. All rights reserved.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        'Made with ❤️ for moms everywhere',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialLink({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
} 