import 'package:cook_book/Components/Tabs.dart';
import 'package:cook_book/service/SingleMealService.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MealRecipe extends StatefulWidget {
  const MealRecipe({super.key, required this.id});
  final String id;

  @override
  State<MealRecipe> createState() => _MealrecipeState();
}

class _MealrecipeState extends State<MealRecipe> {
  late YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(86, 213, 204, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(86, 213, 204, 230),
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
            String videoId =
                YoutubePlayer.convertUrlToId(meal[0].strYoutube ?? '') ?? '';
            controller = YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false, //should be set to true
                mute: false,
              ),
            );

            return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              builder: (context, player) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Meal: ${meal[0].strMeal}",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[900],
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            "Country: ${meal[0].strArea} ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    player,
                    Tabs(
                      meal: meal,
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
