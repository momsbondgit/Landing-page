import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moms_bond/viewmodels/app_viewmodel.dart';

class WaitlistSection extends StatelessWidget {
  const WaitlistSection({super.key});

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
            const Color(0xFFE91E63).withOpacity(0.05),
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
                      'Join the Waitlist',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Be among the first to experience MomsBond',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF4A5568),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                
                // Waitlist Content
                Row(
                  children: [
                    // Left side - Benefits and Stats
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Why Join the Waitlist?',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Benefits List
                          _BenefitItem(
                            text: 'Early access to the platform',
                          ),
                          _BenefitItem(
                            text: 'Exclusive founding member benefits',
                          ),
                          _BenefitItem(
                            text: 'Help shape the future of MomsBond',
                          ),
                          _BenefitItem(
                            text: 'Be part of our beta testing community',
                          ),
                          _BenefitItem(
                            text: 'Priority support and feedback channels',
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Stats
                          Consumer<AppViewModel>(
                            builder: (context, viewModel, child) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: _StatCard(
                                      value: '${viewModel.waitlistStats['totalWaitlist']}+',
                                      label: 'Moms on Waitlist',
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _StatCard(
                                      value: viewModel.waitlistStats['betaLaunchDate'],
                                      label: 'Beta Launch',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 60),
                    
                    // Right side - Waitlist Form
                    Expanded(
                      flex: 1,
                      child: _WaitlistForm(),
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

class _BenefitItem extends StatelessWidget {
  final String text;

  const _BenefitItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xFFE91E63),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF4A5568),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE91E63),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF4A5568),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaitlistForm extends StatefulWidget {
  @override
  State<_WaitlistForm> createState() => _WaitlistFormState();
}

class _WaitlistFormState extends State<_WaitlistForm> {
  String? selectedMomStage;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up for Early Access',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Name Field
                TextFormField(
                  controller: viewModel.waitlistNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFF7FAFC),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Email Field
                TextFormField(
                  controller: viewModel.waitlistEmailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFF7FAFC),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Mom Stage Dropdown
                DropdownButtonFormField<String>(
                  value: selectedMomStage,
                  decoration: const InputDecoration(
                    labelText: 'I\'m a mom of...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFF7FAFC),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'expecting', child: Text('Expecting my first')),
                    DropdownMenuItem(value: 'newborn', child: Text('Newborn (0-6 months)')),
                    DropdownMenuItem(value: 'infant', child: Text('Infant (6-12 months)')),
                    DropdownMenuItem(value: 'toddler', child: Text('Toddler (1-3 years)')),
                    DropdownMenuItem(value: 'preschool', child: Text('Preschool (3-5 years)')),
                    DropdownMenuItem(value: 'school', child: Text('School age (5+ years)')),
                    DropdownMenuItem(value: 'multiple', child: Text('Multiple children')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedMomStage = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                
                // Interests Field
                TextFormField(
                  controller: viewModel.waitlistInterestsController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'What interests you most?',
                    hintText: 'Tell us what you\'re looking for in a mom community...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFF7FAFC),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.isWaitlistSubmitting || selectedMomStage == null
                        ? null
                        : () async {
                            final success = await viewModel.submitWaitlistForm(selectedMomStage!);
                            if (success) {
                              setState(() {
                                selectedMomStage = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Successfully joined the waitlist!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to join waitlist. Please try again.'),
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
                    child: viewModel.isWaitlistSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Join the Waitlist',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We respect your privacy. Your information will never be shared.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF718096),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 