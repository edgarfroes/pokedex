import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/pokemon_model.dart';
import 'rest_api_service.dart';

part 'pokemon_rest_api_service.g.dart';

@riverpod
PokemonApiService pokemonApiService(PokemonApiServiceRef ref) {
  final mapper = ref.watch(pokemonModelFromApiMapperProvider);
  final restApi = ref.watch(restApiServiceProvider.call(
    url: 'pokeapi.co',
    path: 'api/v2',
  ));

  return PokemonApiService(
    mapper: mapper,
    restApi: restApi,
  );
}

class PokemonApiService {
  PokemonApiService({
    required this.restApi,
    required this.mapper,
  });

  final RestApiService restApi;
  final PokemonModelFromApiMapper mapper;

  Future<PokemonListQueryResult> list() async {
    final response = await restApi.get(
      endpoint: _PokemonApiServiceEndpoint.list.endpoint,
      params: {
        'limit': '100000',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('API Error');
    }

    return mapper.fromResponseBody(response.body);
  }
}

@riverpod
class PokemonModelFromApiMapper extends _$PokemonModelFromApiMapper {
  @override
  PokemonModelFromApiMapper build() => PokemonModelFromApiMapper();

  int _extractPokemonIdFromUrl(String url) {
    final urlSplit = url.split('/');

    return int.parse(urlSplit.elementAt(urlSplit.length - 2));
  }

  PokemonListQueryResult fromResponseBody(String body) {
    final responseBody =
        Map.from(jsonDecode(body) as Map).cast<String, dynamic>();

    return PokemonListQueryResult(
      count: responseBody['count'],
      results: (responseBody['results'] as List<dynamic>).map(
        (x) {
          final map = Map.from(x).cast<String, dynamic>();

          final pokemonId = _extractPokemonIdFromUrl(map['url'] as String);

          return PokemonModel(
            id: pokemonId,
            name: map['name'],
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png',
            thumbnailUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/$pokemonId.png',
          );
        },
      ).toList(),
    );
  }
}

enum _PokemonApiServiceEndpoint {
  list('/pokemon'),
  details('/pokemon/{id}');

  final String endpoint;

  const _PokemonApiServiceEndpoint(this.endpoint);
}

class PokemonListQueryResult {
  final int count;
  final List<PokemonModel> results;

  PokemonListQueryResult({
    required this.count,
    required this.results,
  });
}
