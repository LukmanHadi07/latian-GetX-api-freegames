import 'package:get/get.dart';

class GenreGamesController extends GetxController {
  final genre = 'Shooter'.obs;

 void change(String n) => genre.value = n;
}