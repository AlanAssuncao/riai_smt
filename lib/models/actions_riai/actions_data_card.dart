// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ActionsDataCard {
  String id;

  ActionsDataCard({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory ActionsDataCard.fromMap(Map<String, dynamic> map) {
    return ActionsDataCard(
      id: map['id'],
    );
  }

  factory ActionsDataCard.fromJson(String json) =>
      ActionsDataCard.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'ActionsDataCard(id: $id)';
}
