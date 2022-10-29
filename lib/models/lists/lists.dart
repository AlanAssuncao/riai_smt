// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Lists {
  String id;
  String name;
  Lists({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Lists.fromMap(Map<String, dynamic> map) {
    return Lists(
      id: map['id'],
      name: map['name'],
    );
  }

  factory Lists.fromJson(String json) => Lists.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'Lists(id: $id, name: $name)';
}
