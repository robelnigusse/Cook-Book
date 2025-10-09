import 'package:cook_book/model/SingleMealResponse.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Singlemealservice {
  Future<List<Meal>> getSingleMeals(String id) async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final mealsResponse = Singlemealresponse.fromJson(jsonData);
      return mealsResponse.meals;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
