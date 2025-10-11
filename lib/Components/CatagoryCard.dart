import 'package:cook_book/pages/Meals.dart';
import 'package:flutter/material.dart';

import '../model/CategoryResponse.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => Meals(
                title: category.strCategory,
                category: category.strCategory,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image Container with Gradient Overlay
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Image.network(
                          category.strCategoryThumb,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Container(
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: Icon(
                                Icons.restaurant_menu_rounded,
                                size: 40,
                                color: Colors.grey[400],
                              ),
                            );
                          },
                        ),
                        // Gradient Overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(
                                  red: 0.5,
                                  green: 0.5,
                                  blue: 0.5,
                                  alpha: 0.5,
                                ),
                                const Color.fromARGB(20, 0, 0, 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text Content
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: const Color.fromARGB(255, 220, 208, 208),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Center(
                        child: Text(
                          category.strCategory,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 71, 71, 71),
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
            ],
          ),
        ),
      ),
    );
  }
}
