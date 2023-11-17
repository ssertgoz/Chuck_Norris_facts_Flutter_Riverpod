import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';

class CategoryItemButtonUI extends ConsumerWidget {
  const CategoryItemButtonUI({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref
            .read(categoryItemButtonControllerProvider)
            .getJokeByCategory(category);
      },
      child: Text(category),
    );
  }
}
