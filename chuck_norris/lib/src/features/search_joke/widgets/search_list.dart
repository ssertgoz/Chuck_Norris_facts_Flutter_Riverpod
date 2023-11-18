import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchList extends ConsumerWidget {
  const SearchList({Key? key, required this.searchResult}) : super(key: key);
  final SearchResultModel searchResult;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: searchResult.total,
      itemBuilder: (context, index) =>
          SearchItem(joke: searchResult.jokes[index]),
    );
  }
}
