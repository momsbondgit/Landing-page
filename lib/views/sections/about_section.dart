import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Section Header
                Column(
                  children: [
                    Text(
                      'About Us',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Building meaningful connections between mothers',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                
                // About Content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // What is MomsBond
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is MomsBond?',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'MomsBond is a revolutionary social platform designed specifically for mothers who want to connect on a deeper level. We understand that motherhood comes with unique challenges, joys, and experiences that only other mothers can truly understand.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: const Color(0xFF4A5568),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Why We Created This
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why We Created This',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Traditional social media often leaves mothers feeling isolated or misunderstood. We wanted to create a safe, supportive space where mothers can find genuine connections, share their authentic experiences, and support each other through every stage of motherhood.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: const Color(0xFF4A5568),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 60),
                    
                    // Features Grid
                    Row(
                      children: [
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.shield,
                            title: 'Safe Space',
                            description: 'Judgment-free environment for honest conversations',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.people,
                            title: 'Real Connections',
                            description: 'Build meaningful relationships with like-minded mothers',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.chat_bubble,
                            title: 'Deep Conversations',
                            description: 'Discuss real challenges and triumphs of motherhood',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE91E63).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFE91E63),
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF4A5568),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 