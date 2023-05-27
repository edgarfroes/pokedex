import 'package:flutter/material.dart' hide Colors;

const headlineTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 24.0,
  height: 32.0 / 24.0,
);

const subtitle1TextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 14.0,
  height: 16.0 / 14.0,
);

const subtitle2TextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 12.0,
  height: 16.0 / 12.0,
);

const subtitle3TextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 10.0,
  height: 16.0 / 10.0,
);

const body1TextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  height: 16.0 / 14.0,
);

const body2TextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
  height: 16.0 / 12.0,
);

const body3TextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
  height: 16.0 / 10.0,
);

const captionTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 8.0,
  height: 12.0 / 8.0,
);

const smallShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.25),
  offset: Offset(0, 1),
  blurRadius: 3,
  spreadRadius: 1,
);

const largeShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.2),
  offset: Offset(0, 3),
  blurRadius: 12,
  spreadRadius: 3,
);

class Colors {
  Colors._();

  static const MaterialColor primary = MaterialColor(
    0xFFDC0A2D,
    <int, Color>{
      50: Color(0xFFFBE2E6),
      100: Color(0xFFF5B6C0),
      200: Color(0xFFEE8596),
      300: Color(0xFFE7546C),
      400: Color(0xFFE12F4D),
      500: Color(0xFFDC0A2D),
      600: Color(0xFFD80928),
      700: Color(0xFFD30722),
      800: Color(0xFFCE051C),
      900: Color(0xFFC50311),
    },
  );

  static const MaterialAccentColor primaryAccent = MaterialAccentColor(
    0xFFFF6888,
    <int, Color>{
      100: Color(0xFFFFA5B8),
      200: Color(0xFFFF6888),
      400: Color(0xFFFF4E74),
      700: Color(0xFFFF3F68),
    },
  );

  /// Gradient colors.
  static const black = Color(0x00000000);
  static const dark = Color(0xFF1D1D1D);
  static const medium = Color(0xFF666666);
  static const light = Color(0xFFE0E0E0);
  static const background = Color(0xFFEFEFEF);
  static const white = Color(0xFFFFFFFF);
}

enum PokemonTypeColor {
  bug(Color(0xFFA7B723)),
  dragon(Color(0xFF7037FF)),
  electric(Color(0xFFF9CF30)),
  fairy(Color(0xFFE69EAC)),
  fighting(Color(0xFFC12239)),
  fire(Color(0xFFF57D31)),
  flying(Color(0xFFA891EC)),
  ghost(Color(0xFF70559B)),
  grass(Color(0xFF74CB48)),
  ground(Color(0xFFDEC16B)),
  ice(Color(0xFF9AD6DF)),
  normal(Color(0xFFAAA67F)),
  poison(Color(0xFFA43E9E)),
  psychic(Color(0xFFFB5584)),
  rock(Color(0xFFB69E31)),
  steel(Color(0xFFB7B9D0)),
  water(Color(0xFF6493EB));

  final Color color;

  const PokemonTypeColor(this.color);
}
