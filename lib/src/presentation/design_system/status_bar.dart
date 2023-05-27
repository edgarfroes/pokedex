import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  final double progress;
  final Color color;

  const StatusBar({
    Key? key,
    required this.progress,
    required this.color,
  }) : super(key: key);

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _progressAnimation = Tween(begin: 0.0, end: widget.progress).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void didUpdateWidget(StatusBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.progress != oldWidget.progress) {
      _animationController.animateTo(widget.progress);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: widget.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
      ),
      clipBehavior: Clip.hardEdge,
      child: AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _progressAnimation.value,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: widget.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
