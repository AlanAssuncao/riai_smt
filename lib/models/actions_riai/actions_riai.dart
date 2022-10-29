// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'actions_data.dart';
import 'actions_member_creator.dart';

class ActionsRiai {
  //String id;
  ActionsData data;
  String type;
  String date;
  ActionsMemberCreator memberCreator;

  ActionsRiai({
    //required this.id,
    required this.data,
    required this.type,
    required this.date,
    required this.memberCreator,
  });

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'data': data.toMap(),
      'type': type,
      'date': date,
      'memberCreator': memberCreator.toMap(),
    };
  }

  factory ActionsRiai.fromMap(Map<String, dynamic> map) {
    return ActionsRiai(
      //id: map['id'] ?? '',
      data: ActionsData.fromMap( map['data']),
      type: map['type'] ?? '',
      date: map['date'] ?? '',
      memberCreator: ActionsMemberCreator.fromMap(map['memberCreator']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ActionsRiai.fromJson(String json) => ActionsRiai.fromMap(jsonDecode(json));


  @override
  String toString() {
    return 'ActionsRiai(data: $data, type: $type, date: $date, memberCreator: $memberCreator)';
  }
}
