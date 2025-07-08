import 'package:flutter_test/flutter_test.dart';
import 'package:moms_bond/viewmodels/waitlist_viewmodel.dart';

void main() {
  group('WaitlistViewModel', () {
    test('starts in Idle state', () {
      final viewModel = WaitlistViewModel();
      expect(viewModel.state, WaitlistState.idle);
    });
  });
} 