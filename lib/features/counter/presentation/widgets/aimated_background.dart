import 'package:flutter/material.dart';

class ColorFullWidget extends StatefulWidget {
  const ColorFullWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _ColorFullWidgetState createState() => _ColorFullWidgetState();
}

class _ColorFullWidgetState extends State<ColorFullWidget> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    animation = ColorTween(begin: Colors.red.withOpacity(0.2), end: Colors.yellow.shade300)
        .animate(controller);

    controller.repeat(reverse: true, period: const Duration(seconds: 4));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (context, child) {
          return SizedBox(
            child: DecoratedBox(
                child: child,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [animation.value, animation.value]))),
          );
        },
        animation: animation,
        child: widget.child);
  }
}
