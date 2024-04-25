import 'package:get/get.dart';
import 'package:getx_api/app/modules/liveGames/controllers/genre_games_controller.dart';

import '../controllers/live_games_controller.dart';

class LiveGamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveGamesController>(
      () => LiveGamesController(),
    );
     Get.lazyPut<GenreGamesController>(
      () => GenreGamesController(),
    );
  }
}
