import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moms_bond/models/contact_form.dart';
import 'package:moms_bond/models/waitlist_form.dart';

class ApiService {
  static const String baseUrl = 'https://api.momsbond.com'; // Replace with actual API URL
  
  // Contact form submission
  Future<bool> submitContactForm(ContactForm form) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contact'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(form.toJson()),
      );
      
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error submitting contact form: $e');
      return false;
    }
  }

  // Waitlist form submission
  Future<bool> submitWaitlistForm(WaitlistForm form) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/waitlist'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(form.toJson()),
      );
      
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error submitting waitlist form: $e');
      return false;
    }
  }

  // Get waitlist statistics
  Future<Map<String, dynamic>> getWaitlistStats() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/waitlist/stats'));
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      
      return {
        'totalWaitlist': 500,
        'betaLaunchDate': 'Coming Soon',
      };
    } catch (e) {
      print('Error getting waitlist stats: $e');
      return {
        'totalWaitlist': 500,
        'betaLaunchDate': 'Coming Soon',
      };
    }
  }
} 