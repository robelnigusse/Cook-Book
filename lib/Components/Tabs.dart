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
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  Center(
                    child: ListView.builder(
                      itemCount: meal[0].ingredients.length,
                      itemBuilder: (context, index) {
                        final measure = meal[0].measures[index];
                        final ingredient = meal[0].ingredients[index];
                        if (measure == null || measure.trim().isEmpty) {
                          return const SizedBox.shrink(); // an invisible widget
                        }
                        return Row(
                          children: [
                            const Icon(Icons.check_circle_outline,
                                color: Colors.blue, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "$measure • $ingredient",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            _formatInstructions(meal[0].strInstructions ?? ''),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _formatInstructions(String instructions) {
    final steps = instructions
        .replaceAll('\r', '')
        .split(RegExp(r'\n+'))
        .where((line) => line.trim().isNotEmpty)
        .toList();

    return List.generate(steps.length, (index) {
      final step = steps[index].trim();
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                step,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
