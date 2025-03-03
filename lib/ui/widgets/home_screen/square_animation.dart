import 'package:flutter/material.dart';

/// [Widget] displaying the movement of the red square
/// when pressing the buttons ("Left", "Right").
class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

/// State of a [SquareAnimationState].
class SquareAnimationState extends State<SquareAnimation> {
  /// The size of the square.
  static const _squareSize = 50.0;

  /// Duration of the animation
  static const Duration _duration = Duration(milliseconds: 1000);

  /// Current alignment of square.
  Alignment _alignment = Alignment.center;

  /// Wether the animation in progress.
  bool _animationInProgress = false;

  /// Wether the square is at the right edge.
  bool _isRightEdge = false;

  /// Wether the square is at the left edge.
  bool _isLeftEdge = false;

  /// Moves the square to the right edge.
  void _moveToTheRight() {
    setState(() {
      _animationInProgress = true;
      _isRightEdge = true;
      _isLeftEdge = false;
      _alignment = Alignment.centerRight;
    });
  }

  /// Moves the square to the left edge.
  void _moveToTheLeft() {
    setState(() {
      _animationInProgress = true;
      _isLeftEdge = true;
      _isRightEdge = false;
      _alignment = Alignment.centerLeft;
    });
  }

  /// Updates the state after the animation ends.
  void _onEndAnimation() {
    setState(() {
      _animationInProgress = false;
    });
  }

  /// Wether the left buttun is active state.
  bool _isLeftButtonActive() {
    return !_animationInProgress && !_isLeftEdge;
  }

  /// Wether the right buttun is active state.
  bool _isRightButtonActive() {
    return !_animationInProgress && !_isRightEdge;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedAlign(
          duration: _duration,
          alignment: _alignment,
          onEnd: _onEndAnimation,
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: _isLeftButtonActive() ? _moveToTheLeft : null,
              child: const Text('Left'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _isRightButtonActive() ? _moveToTheRight : null,
              child: const Text('Right'),
            ),
          ],
        ),
      ],
    );
  }
}
