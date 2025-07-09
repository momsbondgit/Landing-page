import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonState {
  initial,
  emailInput,
  submitting,
  completed,
}

/// A button that performs a squash-then-burst confetti animation when tapped.
///
/// External libraries are NOT used – the effect is implemented with two
/// AnimationControllers (scale & confetti) and a CustomPainter that renders
/// particles.  The button keeps its original behaviour via the [onTap]
/// callback and exposes a [isLoading] flag so the parent can update the label.
class AnimatedWaitlistButton extends StatefulWidget {
  const AnimatedWaitlistButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
  });

  final Function(String email) onTap;
  final String label;
  final bool isLoading;

  @override
  State<AnimatedWaitlistButton> createState() => _AnimatedWaitlistButtonState();
}

class _AnimatedWaitlistButtonState extends State<AnimatedWaitlistButton>
    with TickerProviderStateMixin {
  late final AnimationController _scaleCtrl;
  late final AnimationController _confettiCtrl;
  late final AnimationController _transformCtrl;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _transformAnim;

  /// Particles generated for the current burst.
  final List<_ConfettiParticle> _particles = [];
  final math.Random _rand = math.Random();

  ButtonState _currentState = ButtonState.initial;
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  String? _emailError;
  bool _isProcessingTap = false;

  @override
  void initState() {
    super.initState();

    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.9).chain(CurveTween(curve: Curves.easeOut)), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.05).chain(CurveTween(curve: Curves.easeOutBack)), weight: 35),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 40),
    ]).animate(_scaleCtrl);

    _confettiCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _transformCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _transformAnim = CurvedAnimation(
      parent: _transformCtrl,
      curve: Curves.easeInOut,
    );

    _confettiCtrl.addListener(() {
      // Trigger repaint on every tick.
      setState(() {});
    });

    _confettiCtrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Clear particles after animation ends.
        _particles.clear();
        // Complete state reset after confetti completes
        setState(() {
          _currentState = ButtonState.initial;
          _emailController.clear();
          _emailError = null;
        });
       
        // Reset all animation controllers to initial state
        _transformCtrl.reset();
        _scaleCtrl.reset();
        
        // Unfocus email input to prevent focus interference
        _emailFocusNode.unfocus();
       
        // Reset tap processing flag
        _isProcessingTap = false;
      }
    });
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _confettiCtrl.dispose();
    _transformCtrl.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    // Prevent double-tap and rapid successive taps
    if (_isProcessingTap || _currentState != ButtonState.initial || _transformCtrl.isAnimating || _confettiCtrl.isAnimating) {
      return;
    }
    
    _isProcessingTap = true;
    
    if (_currentState == ButtonState.initial) {
      // Transform to email input
      setState(() {
        _currentState = ButtonState.emailInput;
      });
      _transformCtrl.forward();
      // Focus on email input immediately for consistent keyboard behavior
      Future.delayed(const Duration(milliseconds: 50), () {
        if (_currentState == ButtonState.emailInput && mounted) {
          _emailFocusNode.requestFocus();
        }
      });
      
      // Reset processing flag after transform animation
      Future.delayed(const Duration(milliseconds: 300), () {
        _isProcessingTap = false;
      });
    }
  }

  void _handleEmailSubmit() async {
    // Prevent multiple submissions
    if (_currentState != ButtonState.emailInput) {
      return;
    }
    
    final email = _emailController.text.trim();
    
    // Validate email
    if (email.isEmpty || !_isValidEmail(email)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
      return;
    }

    setState(() {
      _currentState = ButtonState.submitting;
      _emailError = null;
    });

    // Unfocus input during submission
    _emailFocusNode.unfocus();

    // Call the external callback with email
    widget.onTap(email);

    // Simulate brief processing time then trigger confetti
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (mounted) {
      setState(() {
        _currentState = ButtonState.completed;
      });
      
      // Transform back to button then trigger confetti
      await _transformCtrl.reverse();
      
      if (mounted && _currentState == ButtonState.completed) {
        // Trigger confetti animation
        _scaleCtrl.forward(from: 0);
        _generateParticles();
        _confettiCtrl.forward(from: 0);
      }
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  void _generateParticles() {
    _particles.clear();
    // Generate between 20-30 particles.
    final int count = 20 + _rand.nextInt(11);
    for (int i = 0; i < count; i++) {
      final double angle = _rand.nextDouble() * 2 * math.pi;
      final double maxDistance = 80 + _rand.nextDouble() * 60; // 80–140 px
      final double size = 4 + _rand.nextDouble() * 6; // 4–10 px
      final Color color = Colors.primaries[_rand.nextInt(Colors.primaries.length)]
          .withOpacity(1.0);

      _particles.add(_ConfettiParticle(
        direction: angle,
        maxDistance: maxDistance,
        size: size,
        color: color,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _transformAnim,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_currentState == ButtonState.initial) {
              _handleTap();
            } else if (_currentState == ButtonState.emailInput) {
              // Ensure focus is maintained when clicking anywhere on button
              if (!_emailFocusNode.hasFocus) {
                _emailFocusNode.requestFocus();
              }
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Confetti layer
              CustomPaint(
                painter: _ConfettiPainter(
                  particles: _particles,
                  progress: _confettiCtrl.value,
                ),
                size: const Size(158.64, 43.93),
              ),
              // Button content
              Transform.scale(
                scale: _scaleAnim.value,
                child: _currentState == ButtonState.emailInput || _currentState == ButtonState.submitting
                    ? _EmailInputField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        onSubmit: _handleEmailSubmit,
                        isSubmitting: _currentState == ButtonState.submitting,
                        errorText: _emailError,
                      )
                    : _ButtonVisual(
                        label: widget.label,
                        isLoading: widget.isLoading || _currentState == ButtonState.submitting,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ButtonVisual extends StatelessWidget {
  const _ButtonVisual({required this.label, required this.isLoading});

  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.64,
      height: 43.93,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(3, 4),
            blurRadius: 4,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        isLoading ? 'joining...' : label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _EmailInputField extends StatelessWidget {
  const _EmailInputField({
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
    required this.isSubmitting,
    this.errorText,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmit;
  final bool isSubmitting;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ensure focus when tapping anywhere within the input field
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }
      },
      child: Container(
        width: 158.64,
        height: 43.93,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: errorText != null ? Colors.red : Colors.black,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(3, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 2),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: !isSubmitting,
                  cursorColor: const Color(0xFFE53E3E), // Red color matching heart emoji
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => onSubmit(),
                ),
              ),
            ),
            GestureDetector(
              onTap: isSubmitting ? null : onSubmit,
              child: Container(
                width: 28,
                height: 28,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: isSubmitting
                      ? SizedBox(
                          width: 10,
                          height: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 14,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfettiParticle {
  _ConfettiParticle({
    required this.direction,
    required this.maxDistance,
    required this.size,
    required this.color,
  });

  final double direction; // Radians
  final double maxDistance; // Pixels
  final double size; // Pixels
  final Color color;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({required this.particles, required this.progress});

  final List<_ConfettiParticle> particles;
  final double progress; // 0–1

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final Offset center = Offset(size.width / 2, size.height / 2);

    for (final _ConfettiParticle p in particles) {
      final double distance = p.maxDistance * Curves.easeOut.transform(progress);
      final Offset offset = center + Offset(math.cos(p.direction), math.sin(p.direction)) * distance;
      final double opacity = (1 - progress).clamp(0.0, 1.0);
      paint.color = p.color.withOpacity(opacity);
      // Draw a small rectangle as confetti piece.
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(p.direction);
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 2), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.particles != particles;
  }
} 