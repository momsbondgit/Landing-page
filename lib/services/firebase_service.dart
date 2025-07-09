import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionName = 'waitlist_emails';

  /// Add an email to the waitlist
  static Future<bool> addEmailToWaitlist(String email) async {
    try {
      // Check if email already exists
      final existingEmail = await _firestore
          .collection(_collectionName)
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (existingEmail.docs.isNotEmpty) {
        // Email already exists
        return false;
      }

      // Add new email to Firestore
      await _firestore.collection(_collectionName).add({
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'pending',
      });

      return true;
    } catch (e) {
      print('Error adding email to waitlist: $e');
      return false;
    }
  }

  /// Check if an email is already in the waitlist
  static Future<bool> isEmailInWaitlist(String email) async {
    try {
      final result = await _firestore
          .collection(_collectionName)
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      return result.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email in waitlist: $e');
      return false;
    }
  }

  /// Get all waitlist emails (for admin purposes)
  static Future<List<Map<String, dynamic>>> getAllWaitlistEmails() async {
    try {
      final result = await _firestore
          .collection(_collectionName)
          .orderBy('timestamp', descending: true)
          .get();

      return result.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      print('Error getting waitlist emails: $e');
      return [];
    }
  }

  /// Get waitlist count
  static Future<int> getWaitlistCount() async {
    try {
      final result = await _firestore.collection(_collectionName).get();
      return result.docs.length;
    } catch (e) {
      print('Error getting waitlist count: $e');
      return 0;
    }
  }
} 