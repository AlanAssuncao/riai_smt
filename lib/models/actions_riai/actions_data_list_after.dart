// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ActionsDataListAfter {
  String name;
  
  ActionsDataListAfter({
    required this.name,
  });

   Map<String, dynamic> toMap(){
    return {
      'name': name,
    };
  }

  factory ActionsDataListAfter.fromMap(Map<String,dynamic> map) {
    return ActionsDataListAfter(name: map['name']);
  } 

  factory ActionsDataListAfter.fromJson(String json) => ActionsDataListAfter.fromMap(jsonDecode(json));

  String toJson()=> jsonEncode(toMap());

  @override
  String toString() => 'ActionsDataListAfter(name: $name)';
}
