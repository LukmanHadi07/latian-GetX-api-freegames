import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_api/app/models/games/games.dart';
import 'package:getx_api/app/modules/liveGames/controllers/genre_games_controller.dart';

import '../controllers/live_games_controller.dart';

class LiveGamesView extends StatelessWidget {
   final GenreGamesController genreGamesController = Get.find();
   final  LiveGamesController controller = Get.find();
  

  List<String> genres = [
   'Shooter',
   'MMOARPG',
   'ARPG',
   'Strategy',
   'Figthing'
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Fetch with getx'),
      ),
      body: Column(
        children: [
          Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                children: genres.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ActionChip(
                    onPressed: (){
                      genreGamesController.change(e);
                    },
                    label: Text(e, style: TextStyle(
                      color: genreGamesController.genre.value == e ?  Colors.white : Colors.black ,
                    ),),
                    backgroundColor:  genreGamesController.genre.value == e ?  Theme.of(context).primaryColor : Colors.white ,
                  ),
                );
              }).toList(),
                ),
              ),
            )),
        Expanded(
            child: Obx(() {
              if (controller.status.value == '') {
                return SizedBox.shrink();
              } 
              if(controller.status.value == 'loading') {
                return const Center(
                    child: CircularProgressIndicator(),
                );
              } else if (controller.status.value == 'failed') {
                  return Text(controller.message.value);
              } else {
                final List<Games> filterGenreGames = controller.games.where((element) => element.genre == genreGamesController).toList();
                return GridView.builder(
                  itemCount: controller.games.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                  itemBuilder: (context, index) {
                          Games game = controller.games[index];
                          return ExtendedImage.network(
                            game.thumbnail!,
                            fit: BoxFit.cover,
                          );
                        },);
              }
            }
            //   () => controller.status.value == '' 
            // ? const SizedBox.shrink()
            // : controller.status.value == 'loading' 
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : controller.status.value == 'failed' 
            //         ? Text(controller.message.value)
            //         : GridView.builder(
            //             itemCount: controller.games.length,
            //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3,
            //             ),
            //             itemBuilder: (context, index) {
            //               Games game = controller.games[index];
            //               return ExtendedImage.network(
            //                 game.thumbnail!,
            //                 fit: BoxFit.cover,
            //               );
            //             },
            //           ),
            ),
          ),
        ],
      )
    );
  }
}
