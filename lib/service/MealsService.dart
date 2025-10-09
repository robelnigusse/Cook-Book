// https://www.themealdb.com/api/json/v1/1/filter.php?c=?
import 'dart:convert';

import '../model/MealsResponse.dart';
import 'package:http/http.dart' as http;

class MealsService {
  Future<List<Meals>> getMeals(String category) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final mealsResponse = MealsResponse.fromJson(jsonData);

      return mealsResponse.meals;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
