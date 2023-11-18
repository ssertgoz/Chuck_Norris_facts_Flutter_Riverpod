import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;

  const AnimatedIconButton(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.onPressed})
      : super(key: key);

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        final scale = 1.0 + 0.1 * _controller!.value;
        return Transform(
          transform: Matrix4.identity()..scale(scale),
          child: IconButton(
            icon: Icon(widget.icon),
            onPressed: () {
              _controller!.forward();
              Future.delayed(const Duration(milliseconds: 200)).then((_) {
                _controller!.reverse();
              });
              widget.onPressed();
            },
            color: widget.iconColor,
          ),
        );
      },
    );
  }
}
