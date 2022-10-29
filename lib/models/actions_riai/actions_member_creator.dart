// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ActionsMemberCreator {
  
  String fullName;
  
  ActionsMemberCreator({
    required this.fullName,
  });

  Map<String, dynamic> toMap(){
    return{
      'fullName': fullName,
    };
  }

  factory ActionsMemberCreator.fromMap(Map<String, dynamic> map) => ActionsMemberCreator(fullName: map ['fullName']);

  String toJson() => jsonEncode(toMap());

  factory ActionsMemberCreator.fromJson(String json) => ActionsMemberCreator.fromMap(jsonDecode(json));


  @override
  String toString() => 'ActionsMemberCreator(fullName: $fullName)';
}
