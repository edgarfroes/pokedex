import 'package:flutter/material.dart' hide Colors;
import 'package:pokedex/src/extensions/color_extensions.dart';

class InnerShadow extends Container {
  InnerShadow({
    super.key,
    super.child,
    BoxDecoration? decoration,
    required this.shadow,
  }) : super(
          decoration: decoration,
        );

  final BoxShadow shadow;

  @override
  BoxDecoration? get decoration => super.decoration as BoxDecoration?;

  @override
  Widget build(BuildContext context) {
    final decoration = this.decoration?.copyWith(
              color: this.decoration?.color ?? shadow.color.contrasting,
            ) ??
        BoxDecoration(
          color: shadow.color.contrasting,
        );

    return Container(
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: decoration.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: shadow.color,
                  ),
                  BoxShadow(
                    color: decoration.color!,
                    spreadRadius: -shadow.spreadRadius,
                    blurRadius: shadow.blurRadius,
                    offset: shadow.offset,
                  ),
                ],
              ),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
