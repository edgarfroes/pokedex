import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
import 'package:pokedex/src/presentation/design_system/all.dart';
import 'package:pokedex/src/presentation/screens/home/providers/filtered_list_provider.dart';
import 'package:pokedex/src/services/pokemon_rest_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'pokemon_image_widget.dart';

part 'pokemon_list_widget.g.dart';

class PokemonListWidget extends ConsumerWidget {
  const PokemonListWidget({
    super.key,
    required this.pokemonListQueryResult,
  });

  final PokemonListQueryResult pokemonListQueryResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredListAsyncValue =
        ref.watch(filteredListProvider(pokemonListQueryResult.results));

    return filteredListAsyncValue.when(
      data: (pokemonList) {
        return _PrecacheImagesWidget(
          pokemonList: pokemonList,
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
  }
}

class _PrecacheImagesWidget extends ConsumerWidget {
  const _PrecacheImagesWidget({
    required this.pokemonList,
  });

  final List<PokemonModel> pokemonList;
  final precacheCount = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var urlsToPrecache =
        pokemonList.take(precacheCount).map((x) => x.imageUrl).toList();

    final precacheFirstImagesResult = ref.watch(precacheTopImagesProvider(
      urls: urlsToPrecache,
      context: context,
    ));

    return precacheFirstImagesResult.when(
      skipLoadingOnReload: true,
      data: (_) {
        return _PokemonScrollView(
          filteredPokemonList: pokemonList,
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
  }
}

class _PokemonScrollView extends StatelessWidget {
  const _PokemonScrollView({
    super.key,
    required this.filteredPokemonList,
  });

  final List<PokemonModel> filteredPokemonList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: filteredPokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = filteredPokemonList[index];

              return HookBuilder(
                builder: (context) {
                  useAutomaticKeepAlive(wantKeepAlive: true);

                  return Card(
                    onPressed: () {
                      // TODO: Show details screen.
                    },
                    title: pokemon.name,
                    image: PokemonImage(
                      imageUrl: pokemon.imageUrl,
                    ),
                    topRightText: '#${pokemon.id.toString().padLeft(3, '0')}',
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

@riverpod
FutureOr precacheTopImages(
  PrecacheTopImagesRef ref, {
  required List<String> urls,
  required BuildContext context,
}) {
  for (var url in urls) {
    try {
      precacheImage(
        CachedNetworkImageProvider(
          url,
          scale: 0.5,
        ),
        context,
        onError: (exception, stackTrace) {
          debugPrint(exception.toString());
        },
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
