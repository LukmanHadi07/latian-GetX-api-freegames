import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/app/modules/liveGames/controllers/genre_games_controller.dart';
import 'package:getx_api/app/modules/liveGames/controllers/live_games_controller.dart';
import 'package:getx_api/app/modules/liveGames/views/live_games_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LiveGamesController());
    Get.put(GenreGamesController());
    return GetMaterialApp(
      home:  LiveGamesView()
    );
  }
}

