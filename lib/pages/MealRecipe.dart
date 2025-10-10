import 'package:cook_book/service/SingleMealService.dart';
import 'package:flutter/material.dart';

class MealRecipe extends StatefulWidget {
  const MealRecipe({super.key, required this.id});
  final String id;

  @override
  State<MealRecipe> createState() => _MealrecipeState();
}

class _MealrecipeState extends State<MealRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SingleMealService().getSingleMeals(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final meal = snapshot.data ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Full UI goes here
              ],
            );
          }
        },
      ),
    );
  }
}
