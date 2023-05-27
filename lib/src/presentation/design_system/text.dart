import 'package:flutter/material.dart' as material show Text;
import 'package:flutter/material.dart' hide Text, Colors;

import 'tokens.dart';

class Text extends material.Text {
  Text.headline(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: headlineTextStyle.copyWith(color: color),
        );

  Text.subtitle1(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: subtitle1TextStyle.copyWith(color: color),
        );

  Text.subtitle2(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: subtitle2TextStyle.copyWith(color: color),
        );

  Text.subtitle3(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: subtitle3TextStyle.copyWith(color: color),
        );

  Text.body1(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: body1TextStyle.copyWith(color: color),
        );

  Text.body2(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: body2TextStyle.copyWith(color: color),
        );

  Text.body3(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: body3TextStyle.copyWith(color: color),
        );

  Text.caption(
    String data, {
    super.key,
    Color? color,
  }) : super(
          data,
          style: captionTextStyle.copyWith(color: color),
        );
}
