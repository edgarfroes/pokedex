import 'package:pokedex/src/presentation/screens/home/providers/search_query_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/pokemon_model.dart';

part 'filtered_list_provider.g.dart';

@riverpod
Future<List<PokemonModel>> filteredList(
  FilteredListRef ref,
  List<PokemonModel> allPokemonList,
) async {
  final searchQuery = ref.watch(searchQueryProvider);

  final filteredList = [...allPokemonList];

  // TODO: add filter conditions.
  if (searchQuery.isNotEmpty == true) {
    filteredList.removeWhere((x) => !x.name.contains(searchQuery));
  }

  return filteredList;
}
