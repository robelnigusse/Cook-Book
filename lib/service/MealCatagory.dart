import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cook_book/model/CategoryResponse.dart';

class MealCatagory {
  Future<List<Category>> getMealCatagory() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final categoryResponse = CategoryResponse.fromJson(jsonData);
      return categoryResponse.categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
