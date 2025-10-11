import 'package:cook_book/model/SingleMealResponse.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.meal});
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.grey[600],
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(
                text: 'Ingredients',
              ),
              Tab(
                text: 'Instructions',
              )
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(children: [
              Center(
                child: ListView.builder(
                  itemCount: meal[0].ingredients.length,
                  itemBuilder: (context, index) => Text(
                      "${meal[0].measures[index]} ,    ${meal[0].ingredients[index]}"),
                ),
              ),
              Center(
                child: Text(meal[0].strInstructions ?? ''),
              )
            ]),
          )
        ],
      ),
    );
  }
}
