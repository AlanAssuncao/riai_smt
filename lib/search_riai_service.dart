
import 'package:trello_01/modules/board_controller/board_controller.dart';

class SearchRiaiService {
  static Future getSuggestions (String query) async {
    final board = await BoardController().findAll();
   
    //var listBoard = board.map((e) => e.name);

    var boardsuggestion = board.where((element) => element.name.toLowerCase().contains(query.toLowerCase()));

    return boardsuggestion;
  }
}