// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Board {
  String name;
  List<String>? nameMembers;
  String list;
  String due;
  String start;
  String timeago;
  String label;
  List<String>? making;

  Board({
    required this.name,
    this.nameMembers,
    required this.list,
    required this.label,
    required this.due,
    required this.start,
    required this.timeago,
    required this.making,
  });


  // Construtor que pega um Map e transforma em um objeto.
 factory Board.fromMap(Map<String,dynamic> map){
    return Board(
      name: map['name'] ?? '',
      nameMembers: map['fullName'],
      list: map['list'] ?? '',
      label: map['label'] ?? '',
      due: map['due'] ?? '',
      start: map['start'] ?? '',
      timeago: map['timeago'] ?? '',
      making: map['making'] ?? '',
    );
      
 }

 // Método que pega o json que é uma string e retorna um mapa do objeto
  factory Board.fromJson(String json) => Board.fromMap(jsonDecode(json));

// Método que pega o objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'name': name,
       'idMembers': nameMembers,
       'list': list,
       'label': label,
       'due': due,
       'start': start,
       'timeago': timeago,
       'making': making,
    };
  }

  @override
  String toString() {
    return 'Board(name: $name, nameMembers: $nameMembers, list: $list, due: $due, start: $start, timeago: $timeago, label: $label, making: $making)';
  }

  Board copyWith({
    String? name,
    List<String>? nameMembers,
    String? list,
    String? due,
    String? start,
    String? timeago,
    String? label,
    List<String>? making,
  }) {
    return Board(
      name: name ?? this.name,
      nameMembers: nameMembers ?? this.nameMembers,
      list: list ?? this.list,
      due: due ?? this.due,
      start: start ?? this.start,
      timeago: timeago ?? this.timeago,
      label: label ?? this.label,
      making: making ?? this.making,
    );
  }

  @override
  bool operator ==(covariant Board other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      listEquals(other.nameMembers, nameMembers) &&
      other.list == list &&
      other.due == due &&
      other.start == start &&
      other.timeago == timeago &&
      other.label == label &&
      listEquals(other.making, making);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      nameMembers.hashCode ^
      list.hashCode ^
      due.hashCode ^
      start.hashCode ^
      timeago.hashCode ^
      label.hashCode ^
      making.hashCode;
  }
}
