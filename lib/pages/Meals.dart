import 'package:cook_book/service/MealsService.dart';
import 'package:flutter/material.dart';

class Meals extends StatefulWidget {
  const Meals({super.key, required this.title, required this.category});
  final String title;
  final String category;

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Color fav = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: MealsService().getMeals(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading Recipes...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Failed to load recipes',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please check your connection',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          final meals = snapshot.data ?? [];
          if (meals.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No recipes found',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Image.network(
                                  meal.strMealThumb,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      color: Colors.grey[200],
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[200],
                                      child: Icon(
                                        Icons.fastfood,
                                        size: 40,
                                        color: Colors.grey[400],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Center(
                                    child: Text(
                                      meal.strMeal,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  // if (fav == Colors.white) {
                                  //   setState(() {
                                  //     fav = Colors.red;
                                  //   });
                                  // } else {
                                  //   setState(() {
                                  //     fav = Colors.white;
                                  //   });
                                  // }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: fav,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
