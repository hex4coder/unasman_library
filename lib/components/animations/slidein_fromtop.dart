import 'package:flutter/material.dart';

class SlideInFromTopAnimation extends StatelessWidget {
  const SlideInFromTopAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: -200.0, end: 0.0),
      duration: Duration(
        milliseconds: 500,
      ),
      child: child,
      builder: (_, double value, child) => Transform.translate(
        offset: Offset(0, value),
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 400),
            child: child,
            builder: (_, double v, c) {
              return Transform.scale(
                scale: v,
                child: Opacity(
                  opacity: v,
                  child: c,
                ),
              );
            }),
      ),
    );
  }
}
