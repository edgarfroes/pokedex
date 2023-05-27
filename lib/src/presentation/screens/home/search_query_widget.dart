import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design_system/all.dart';
import 'providers/search_query_provider.dart';

class SearchQueryWidget extends ConsumerWidget {
  const SearchQueryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textQuery = ref.watch(searchQueryProvider);
    final searchNotifier = ref.watch(searchQueryProvider.notifier);

    return TextField(
      initialText: textQuery,
      icon: Icons.search,
      hint: 'Search',
      onChanged: searchNotifier.onChange,
      onSubmit: searchNotifier.onChange,
      onIconTap: () {
        // TODO.
      },
    );
  }
}
