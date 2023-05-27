import 'package:pokedex/src/services/pokemon_rest_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) =>
    PokemonRepository(
      apiService: ref.watch(pokemonApiServiceProvider),
    );

class PokemonRepository {
  final PokemonApiService apiService;

  PokemonRepository({
    required this.apiService,
  });

  Future<PokemonListQueryResult> list() => apiService.list();
}
