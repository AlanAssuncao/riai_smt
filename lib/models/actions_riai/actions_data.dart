// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'actions_data_card.dart';
import 'actions_data_list_after.dart';

class ActionsData {
  ActionsDataCard card;
  ActionsDataListAfter listAfter;

  ActionsData({
    required this.card,
    required this.listAfter,
  });

  Map<String, dynamic> toMap() {
    return {
      'card': card.toMap(),
      'listAfter': listAfter.toMap(),
    };
  }

  factory ActionsData.fromMap(Map<String,dynamic> map){
    return ActionsData(
      card: ActionsDataCard.fromMap(map['card']),
      listAfter: ActionsDataListAfter.fromMap(map['listAfter']),
    );
  }

  factory ActionsData.fromJson(String json) => ActionsData.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  
  @override
  String toString() {
    return 'ActionsData(ActionsDataCard: $card, ActionsDataListAfter: $listAfter)';
  }
}
