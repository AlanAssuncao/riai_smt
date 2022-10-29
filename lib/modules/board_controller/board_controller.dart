import 'package:trello_01/models/board/board.dart';
import 'package:trello_01/repositories/riai/riai_repository.dart';

class BoardController {
  final riaiRepository = RiaiRepository().allBoards();

  Future<List<Board>> findAll() async {
    // List<Board> futureList = await riaiRepository.allBoards();
    // return futureList;
    //var result = board.map((e) => e.name).toList();

    return await riaiRepository;
  }

  Future<List<Board>> onChange(
      String value, Future<List<Board>>? listBoard) async {
    final riaiRepository = RiaiRepository();
    var board = await listBoard;

    List<Board> list = board!
        .where((element) =>
            element.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();

    if (list.isEmpty) {
      return board;
    } else {
      return list;
    }
  }
}
