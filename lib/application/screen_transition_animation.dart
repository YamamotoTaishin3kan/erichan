import 'package:flutter/material.dart';

class FadeAnimationDecorator extends StatefulWidget {
  const FadeAnimationDecorator(this.ch, {Key? key}) : super(key: key);

  final Widget ch;

  @override
  _FadeAnimationDecoratorState createState() => _FadeAnimationDecoratorState();
}

class _FadeAnimationDecoratorState extends State<FadeAnimationDecorator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _animationController.forward(from: 0.0);

    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildAnimation(),
    );
  }

  Widget _buildAnimation() {
    final animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: widget.ch,
        );
      },
    );
  }
}
