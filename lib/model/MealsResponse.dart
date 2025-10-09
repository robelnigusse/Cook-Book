class MealsResponse {
  List<Meals> meals;
  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['meals'] ?? [];
    return MealsResponse(
      meals: list.map((item) => Meals.fromJson(item)).toList(),
    );
  }
}

class Meals {
  Meals(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      strMeal: json['strMeal'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      idMeal: json['idMeal'] ?? '',
    );
  }
}
