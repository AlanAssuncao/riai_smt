// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Badges {
  String? due;
  String? start;

  Badges({
     this.due,
     this.start,
  });

  Map <String,dynamic> toMap(){
    return {
      'due': due,
      'start': start,
    };
  }

  factory Badges.fromMap(Map<String,dynamic> map){
    return Badges(
      due: map['due'],
      start: map['start'],
    );
  }

  factory Badges.fromJson(String json) => Badges.fromMap(jsonDecode(json));

  String toJson()=> jsonEncode(toMap());
  

  @override
  String toString() => 'Badges(due: $due, start: $start)';
}
