import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../repositories/pokemon_repository.dart';
import '../../../../services/pokemon_rest_api_service.dart';

part 'fetch_all_pokemon_provider.g.dart';

@riverpod
Future<PokemonListQueryResult> fetchAllPokemon(FetchAllPokemonRef ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return pokemonRepository.list();
}
