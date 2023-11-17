import 'package:flutter/material.dart';
import '../../features/random_joke/widgets/category/combiner.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesCombinerUI(),
    );
  }
}
