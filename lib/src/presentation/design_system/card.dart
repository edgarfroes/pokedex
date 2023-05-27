import 'package:flutter/material.dart' hide Card, Colors, Text;
import 'package:pokedex/src/presentation/design_system/text.dart';
import 'package:pokedex/src/presentation/design_system/tokens.dart';

class Card extends StatefulWidget {
  const Card({
    super.key,
    required this.title,
    required this.topRightText,
    required this.image,
    required this.onPressed,
  });

  final String title;
  final String topRightText;
  final Widget? image;
  final VoidCallback onPressed;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.all(smallShadow.blurRadius),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            smallShadow,
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const _CardBackground(),
            Positioned(
              top: 8,
              right: 8,
              child: Text.caption(
                widget.topRightText,
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.7,
                alignment: Alignment.center,
                child: widget.image,
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text.body3(
                widget.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.background,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
