import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'gen/assets.gen.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Move this.
  final logo = SvgAssetLoader(Assets.icons.pokeball);
  await svg.cache.putIfAbsent(logo.cacheKey(null), () => logo.loadBytes(null));

  runApp(const MyApp());
}
