import '../../../DTOs/categories_dto.dart';

class CategoriesModel {
  final List<String> categories;

  CategoriesModel({
    required this.categories,
  });

  factory CategoriesModel.fromDTO(CategoriesDTO dto) {
    return CategoriesModel(
      categories: dto.categories.map<String>((e) => e.toString()).toList(),
    );
  }

  factory CategoriesModel.fromModel(CategoriesModel categoriesModel) {
    CategoriesModel newModel =
        CategoriesModel(categories: categoriesModel.categories);
    return newModel;
  }
}
