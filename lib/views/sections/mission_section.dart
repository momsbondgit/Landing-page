import 'package:flutter/material.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFF7FAFC),
            Colors.white,
            const Color(0xFFF8BBD9).withOpacity(0.1),
          ],
        ),
      ),
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
                      'Our Mission',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Empowering mothers through authentic connections',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                
                // Mission Content
                Row(
                  children: [
                    // Left side - Mission Card
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E63),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.gps_fixed,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Our Vision',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'To create a world where no mother feels alone in her journey. We envision a global community where mothers can find support, understanding, and friendship at every stage of motherhood.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.9),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 40),
                    
                    // Right side - Values
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _ValueItem(
                            icon: Icons.favorite,
                            title: 'Authenticity',
                            description: 'We believe in real, honest conversations about the beautiful mess that is motherhood.',
                          ),
                          const SizedBox(height: 24),
                          _ValueItem(
                            icon: Icons.volunteer_activism,
                            title: 'Support',
                            description: 'Every mother deserves a supportive community that lifts her up and celebrates her wins.',
                          ),
                          const SizedBox(height: 24),
                          _ValueItem(
                            icon: Icons.lock,
                            title: 'Safety',
                            description: 'Creating a secure environment where mothers feel comfortable sharing their deepest thoughts.',
                          ),
                          const SizedBox(height: 24),
                          _ValueItem(
                            icon: Icons.public,
                            title: 'Inclusivity',
                            description: 'Welcoming mothers from all walks of life, backgrounds, and parenting styles.',
                          ),
                        ],
                      ),
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

class _ValueItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValueItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFE91E63).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFE91E63),
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF4A5568),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 