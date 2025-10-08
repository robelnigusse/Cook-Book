class CategoryResponse {
  final List<Category> categories;

  CategoryResponse({required this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['categories'] ?? [];
    return CategoryResponse(
      categories: list.map((item) => Category.fromJson(item)).toList(),
    );
  }
}

class Category {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String? strCategoryDescription; // nullable, in case it's missing

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json['idCategory'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strCategoryThumb: json['strCategoryThumb'] ?? '',
      strCategoryDescription: json['strCategoryDescription'], // could be null
    );
  }
}
