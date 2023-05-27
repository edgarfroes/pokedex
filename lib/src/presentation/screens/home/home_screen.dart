import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/src/presentation/screens/home/pokemon_list_widget.dart';
import 'package:pokedex/src/presentation/screens/home/search_query_widget.dart';

import '../../../services/pokemon_rest_api_service.dart';
import '../../design_system/all.dart';
import 'providers/fetch_all_pokemon_provider.dart';
import 'splash_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shouldDisplay = useState(true);

    return Scaffold(
      body: SplashScreen(
        display: shouldDisplay.value,
        child: SafeArea(
          child: Consumer(
            builder: (_, WidgetRef ref, __) {
              final allPokemonListQueryResult =
                  ref.watch(fetchAllPokemonProvider);

              return allPokemonListQueryResult.when(
                data: (pokemonListQueryResult) {
                  Future.delayed(const Duration(seconds: 3)).whenComplete(() {
                    shouldDisplay.value = false;
                  });

                  return _HomeScreenContent(
                    pokemonListQueryResult: pokemonListQueryResult,
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  // TODO: Add error.
                  return Center(
                    child: Text.headline('Error'),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({
    required this.pokemonListQueryResult,
  });

  final PokemonListQueryResult pokemonListQueryResult;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 20,
            ),
            sliver: SliverAppBar(
              pinned: true,
              titleSpacing: 16,
              leadingWidth: 40,
              toolbarHeight: 48,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(
                  Assets.icons.pokeball,
                  width: 24,
                  height: 24,
                ),
              ),
              title: Text.headline('Pokédex'),
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(36),
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                  child: const SearchQueryWidget(),
                ),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: InnerShadow(
          shadow: smallShadow,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: PokemonListWidget(
            pokemonListQueryResult: pokemonListQueryResult,
          ),
        ),
      ),
    );
  }
}
