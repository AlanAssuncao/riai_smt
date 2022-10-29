import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trello_01/models/board/board.dart';
import 'package:trello_01/models/cards_riai/card_riai.dart';
import 'package:trello_01/models/lists/lists.dart';
import 'package:trello_01/models/members/members.dart';
import 'package:timeago/timeago.dart' as timeago;

class RiaiRepository {
  Uri url = Uri.parse(
      'https://api.trello.com/1/boards/62ed2ed63a541e8a7cc2fd6b/'
      '?fields=id&cards=visible&members=all&lists=all&labels=all'
      '&key=1f2bd954f799c3e77ee78e26437e528f'
      '&token=8d28a4ec685faf93b8dda708b03f0490d89fb951d5ba755f4674cb00df266385');


  Future<List<Board>> allBoards() async {
    
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List members = await data['members'];
      List cards = await data['cards'];
      List lists = await data['lists'];
      List labels = await data['labels'];

      //print(data);

      var cardData =  cards.map<CardRiai>((element) {
        return CardRiai.fromMap(element);
      }).toList();
      var memberData = members.map<Members>((element) {
        return Members.fromMap(element);
      }).toList();

      var listsData = lists.map<Lists>((element) {
        return Lists.fromMap(element);
      }).toList();

      var labelsData = labels.map<Lists>((element) {
        return Lists.fromMap(element);
      }).toList();    


      //print(list);

              

      final newMap = cardData.map((element) {
        final member = memberData.where((m) => element.idMembers!.contains(m.id));
        final list = listsData.where((e) => element.idList == e.id).toList();
        final label = labelsData.where((e) => element.idLabel!.contains(e.id));

       
        return {
          "name": element.name,
          "fullName": member.map((e) => e.fullName).toList(),
          "list": list.map((e) => e.name).toString().replaceAll('(','').replaceAll(')', ''),
          "due": element.badges.due,
          "start": element.badges.start,
          "timeago": element.badges.start != null ? timeago.format (DateTime.parse(element.badges.start.toString()), locale: 'pt_br',) : '',
          "label": label.map((e) => e.name).toString().replaceAll(')','').replaceAll('(', ''),
          "making": list.map((e) => e.name).where((C) => C == '1- A FAZER').toList(),
        };
         
      }).toList();
     
     

      var board = newMap.map((element) {
        return Board.fromMap(element);
      }).toList();


      return board;
      

    } else {
      return [];
    }
  }

  String ageRiai (String date){

    var dateNow = DateTime.now().toString();

    return '';
    
  }
     
}
