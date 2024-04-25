import 'package:get/get.dart';
import 'package:getx_api/app/models/games/games.dart';
import 'package:getx_api/app/source/games/games_source.dart';

class LiveGamesController extends GetxController {
  var status = 'loading'.obs;
  var message = ''.obs;
  var games = <Games>[].obs;



  @override
  void onInit() {
    fetchLiveGames();
    super.onInit();
  }

  @override
  void onReady() {
    fetchLiveGames();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchLiveGames() async {
    status.value = 'loading';
    final fetchedGames = await GameSource.getLiveGames();
    if (fetchedGames == null) {
      status.value = 'failed';
      message.value = 'something failed';
      games.clear();
    } else {
      status.value = 'success';
      message.value = '';
      games.assignAll(fetchedGames);
    }
  }

 
}
