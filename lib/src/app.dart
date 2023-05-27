import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/src/presentation/design_system/all.dart';

import 'presentation/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Pokedéx',
        theme: mainTheme,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
