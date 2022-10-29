// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Labels {
  String id;
  String name;
  Labels({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Labels.fromMap(Map<String, dynamic> map) {
    return Labels(
      id: map['id'],
      name: map['name'],
    );
  }

  factory Labels.fromJson(String json) => Labels.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'Lists(id: $id, name: $name)';
}
