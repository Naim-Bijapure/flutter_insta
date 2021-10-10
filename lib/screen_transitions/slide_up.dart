import 'package:flutter/material.dart';

class SlideUp extends StatefulWidget {
  const SlideUp({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _SlideUpState createState() => _SlideUpState();
}

class _SlideUpState extends State<SlideUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late CurvedAnimation _curve;
  @override
  void initState() {
    super.initState();
    // controller init
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(_curve);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
