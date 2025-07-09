import 'package:flutter/foundation.dart';
import '../services/firebase_service.dart';

/// Represents the current state of the wait-list join flow.
enum WaitlistState { idle, loading, success, error, duplicateEmail }

/// ViewModel responsible for handling the presentation logic for the
/// "Join waitlist" CTA and form.
///
/// It follows the MVVM pattern and exposes an immutable [state] that can be
/// observed by the UI via [ChangeNotifier].
class WaitlistViewModel extends ChangeNotifier {
  WaitlistState _state = WaitlistState.idle;
  String _errorMessage = '';

  WaitlistState get state => _state;
  String get errorMessage => _errorMessage;

  /// Validates email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }

  /// Triggers the join-waitlist use-case with email validation and Firebase storage
  Future<void> joinWaitlist(String email) async {
    if (_state == WaitlistState.loading) return; // Prevent duplicate submits.
    
    // Reset error message
    _errorMessage = '';
    
    // Validate email format
    if (!_isValidEmail(email)) {
      _errorMessage = 'Please enter a valid email address';
      _updateState(WaitlistState.error);
      return;
    }

    _updateState(WaitlistState.loading);

    try {
      // Check if email already exists and add to waitlist
      final success = await FirebaseService.addEmailToWaitlist(email);
      
      if (success) {
        _updateState(WaitlistState.success);
      } else {
        _errorMessage = 'This email is already on the waitlist';
        _updateState(WaitlistState.duplicateEmail);
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please try again.';
      _updateState(WaitlistState.error);
    }
  }

  /// Reset the state to idle
  void resetState() {
    _updateState(WaitlistState.idle);
    _errorMessage = '';
  }

  void _updateState(WaitlistState newState) {
    _state = newState;
    notifyListeners();
  }
} 