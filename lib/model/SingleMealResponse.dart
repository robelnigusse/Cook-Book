class Singlemealresponse {
  final List<Meal> meals;

  Singlemealresponse({required this.meals});

  factory Singlemealresponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> mealList = json['meals'] ?? [];
    return Singlemealresponse(
      meals: mealList.map((meal) => Meal.fromJson(meal)).toList(),
    );
  }
}

class Meal {
  final String idMeal;
  final String strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;

  final List<String?> ingredients;
  final List<String?> measures;

  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
    required this.measures,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String?> ingredients = List.generate(
        20, (index) => json['strIngredient${index + 1}']?.toString());
    List<String?> measures = List.generate(
        20, (index) => json['strMeasure${index + 1}']?.toString());

    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }
}
