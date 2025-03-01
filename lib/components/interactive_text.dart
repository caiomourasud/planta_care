import 'package:flutter/material.dart';

class InteractiveText extends StatefulWidget {
  const InteractiveText({
    required this.text,
    this.style,
    required this.onTap,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback onTap;

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _opacity = 0.5;
        });
      },
      onTapUp: (_) {
        setState(() {
          _opacity = 1.0;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _opacity = 1.0;
        });
      },
      child: Opacity(
        opacity: _opacity,
        child: Text(
          widget.text,
          style: widget.style ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ),
    );
  }
}
