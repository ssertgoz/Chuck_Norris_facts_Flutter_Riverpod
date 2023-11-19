import 'package:chuck_norris/src/constants/paddings.dart';
import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchListUI extends ConsumerWidget {
  const SearchListUI({Key? key, required this.searchResult}) : super(key: key);
  final SearchResultModel searchResult;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: CustomPaddings.listPadding,
      itemCount: searchResult.total,
      itemBuilder: (context, index) =>
          ListItemItemUI(joke: searchResult.jokes[index]),
    );
  }
}
