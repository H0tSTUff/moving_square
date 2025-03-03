import 'package:flutter/material.dart';

/// [Enum] describes the position of the square.
enum SquarePosition {
  leftEdge,
  rightEdge,
  center;
}

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

  /// Whether the animation in progress.
  bool _animationInProgress = false;

  /// Position of the square.
  SquarePosition _squarePosition = SquarePosition.center;

  /// Moves the square to the right edge.
  void _moveToTheRight() {
    setState(() {
      _animationInProgress = true;
      _squarePosition = SquarePosition.rightEdge;
      _alignment = Alignment.centerRight;
    });
  }

  /// Moves the square to the left edge.
  void _moveToTheLeft() {
    setState(() {
      _animationInProgress = true;
      _squarePosition = SquarePosition.leftEdge;
      _alignment = Alignment.centerLeft;
    });
  }

  /// Updates the state after the animation ends.
  void _onEndAnimation() {
    setState(() {
      _animationInProgress = false;
    });
  }

  /// Whether the left button is active state.
  bool _isLeftButtonActive() {
    return !_animationInProgress && _squarePosition != SquarePosition.leftEdge;
  }

  /// Whether the right button is active state.
  bool _isRightButtonActive() {
    return !_animationInProgress && _squarePosition != SquarePosition.rightEdge;
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
