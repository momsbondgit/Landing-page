import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moms_bond/viewmodels/app_viewmodel.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                      'Contact Us',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We\'d love to hear from you',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                
                // Contact Content
                Row(
                  children: [
                    // Left side - Contact Info
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get in Touch',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Have questions about MomsBond? Want to learn more about our platform? We\'re here to help!',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              color: const Color(0xFF4A5568),
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 40),
                          
                          // Contact Methods
                          _ContactMethod(
                            icon: Icons.email,
                            title: 'Email',
                            value: 'hello@momsbond.com',
                          ),
                          const SizedBox(height: 24),
                          _ContactMethod(
                            icon: Icons.location_on,
                            title: 'Location',
                            value: 'Coming soon to a screen near you!',
                          ),
                          const SizedBox(height: 24),
                          _ContactMethod(
                            icon: Icons.access_time,
                            title: 'Response Time',
                            value: 'We\'ll get back to you within 24 hours',
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 60),
                    
                    // Right side - Contact Form
                    Expanded(
                      flex: 1,
                      child: _ContactForm(),
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

class _ContactMethod extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactMethod({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF4A5568),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: 1,
            ),
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send us a Message',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Name Field
                TextFormField(
                  controller: viewModel.contactNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Email Field
                TextFormField(
                  controller: viewModel.contactEmailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Subject Field
                TextFormField(
                  controller: viewModel.contactSubjectController,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Message Field
                TextFormField(
                  controller: viewModel.contactMessageController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.isContactSubmitting
                        ? null
                        : () async {
                            final success = await viewModel.submitContactForm();
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Message sent successfully!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to send message. Please try again.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: viewModel.isContactSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Send Message',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 