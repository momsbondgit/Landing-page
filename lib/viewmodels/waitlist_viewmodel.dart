import 'package:flutter/foundation.dart';

/// Represents the current state of the wait-list join flow.
enum WaitlistState { idle, loading, success, error }

/// ViewModel responsible for handling the presentation logic for the
/// "Join waitlist" CTA and form.
///
/// It follows the MVVM pattern and exposes an immutable [state] that can be
/// observed by the UI via [ChangeNotifier].
class WaitlistViewModel extends ChangeNotifier {
  WaitlistState _state = WaitlistState.idle;

  WaitlistState get state => _state;

  /// Triggers the join-waitlist use-case.
  Future<void> joinWaitlist() async {
    if (_state == WaitlistState.loading) return; // Prevent duplicate submits.
    _updateState(WaitlistState.loading);

    // TODO: Inject a repository/service; for now, simulate a network call.
    await Future<void>.delayed(const Duration(seconds: 1));

    // For the initial scaffold we simply mark success.
    _updateState(WaitlistState.success);
  }

  void _updateState(WaitlistState newState) {
    _state = newState;
    notifyListeners();
  }
} 