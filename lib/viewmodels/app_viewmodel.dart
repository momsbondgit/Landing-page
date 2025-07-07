import 'package:flutter/material.dart';
import 'package:moms_bond/services/api_service.dart';
import 'package:moms_bond/models/contact_form.dart';
import 'package:moms_bond/models/waitlist_form.dart';

class AppViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  // Loading states
  bool _isContactSubmitting = false;
  bool _isWaitlistSubmitting = false;
  bool _isLoadingStats = false;
  
  // Form data
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController contactEmailController = TextEditingController();
  final TextEditingController contactSubjectController = TextEditingController();
  final TextEditingController contactMessageController = TextEditingController();
  
  final TextEditingController waitlistNameController = TextEditingController();
  final TextEditingController waitlistEmailController = TextEditingController();
  final TextEditingController waitlistInterestsController = TextEditingController();
  
  // Waitlist stats
  Map<String, dynamic> _waitlistStats = {
    'totalWaitlist': 500,
    'betaLaunchDate': 'Coming Soon',
  };
  
  // Getters
  bool get isContactSubmitting => _isContactSubmitting;
  bool get isWaitlistSubmitting => _isWaitlistSubmitting;
  bool get isLoadingStats => _isLoadingStats;
  Map<String, dynamic> get waitlistStats => _waitlistStats;
  
  // Contact form submission
  Future<bool> submitContactForm() async {
    if (contactNameController.text.isEmpty ||
        contactEmailController.text.isEmpty ||
        contactSubjectController.text.isEmpty ||
        contactMessageController.text.isEmpty) {
      return false;
    }
    
    _isContactSubmitting = true;
    notifyListeners();
    
    try {
      final form = ContactForm(
        name: contactNameController.text,
        email: contactEmailController.text,
        subject: contactSubjectController.text,
        message: contactMessageController.text,
      );
      
      final success = await _apiService.submitContactForm(form);
      
      if (success) {
        // Clear form on success
        contactNameController.clear();
        contactEmailController.clear();
        contactSubjectController.clear();
        contactMessageController.clear();
      }
      
      return success;
    } finally {
      _isContactSubmitting = false;
      notifyListeners();
    }
  }
  
  // Waitlist form submission
  Future<bool> submitWaitlistForm(String momStage) async {
    if (waitlistNameController.text.isEmpty ||
        waitlistEmailController.text.isEmpty ||
        momStage.isEmpty) {
      return false;
    }
    
    _isWaitlistSubmitting = true;
    notifyListeners();
    
    try {
      final form = WaitlistForm(
        fullName: waitlistNameController.text,
        email: waitlistEmailController.text,
        momStage: momStage,
        interests: waitlistInterestsController.text,
      );
      
      final success = await _apiService.submitWaitlistForm(form);
      
      if (success) {
        // Clear form on success
        waitlistNameController.clear();
        waitlistEmailController.clear();
        waitlistInterestsController.clear();
        
        // Refresh stats
        await loadWaitlistStats();
      }
      
      return success;
    } finally {
      _isWaitlistSubmitting = false;
      notifyListeners();
    }
  }
  
  // Load waitlist statistics
  Future<void> loadWaitlistStats() async {
    _isLoadingStats = true;
    notifyListeners();
    
    try {
      _waitlistStats = await _apiService.getWaitlistStats();
    } finally {
      _isLoadingStats = false;
      notifyListeners();
    }
  }
  
  @override
  void dispose() {
    contactNameController.dispose();
    contactEmailController.dispose();
    contactSubjectController.dispose();
    contactMessageController.dispose();
    waitlistNameController.dispose();
    waitlistEmailController.dispose();
    waitlistInterestsController.dispose();
    super.dispose();
  }
} 