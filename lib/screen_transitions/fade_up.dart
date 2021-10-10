import 'package:flutter/material.dart';

class FadeUp extends StatefulWidget {
  const FadeUp({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _FadeUpState createState() => _FadeUpState();
}

class _FadeUpState extends State<FadeUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late CurvedAnimation _curveAnimation;
  @override
  void initState() {
    super.initState();
    // controller init
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _curveAnimation = CurvedAnimation(parent: _controller, curve: Curves.ease);

    // _animation = Tween<Offset>(
    //   begin: const Offset(0.0, 1.0),
    //   end: Offset.zero,
    // ).animate(_curveAnimation);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _curveAnimation,
      child: widget.child,
    );
  }
}
