// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'badges.dart';

class CardRiai {
  String id;
  String name;
  List<String>? idMembers;
  String idList;
  Badges badges;
  List<String>? idLabel;
  
  
  CardRiai({
    required this.id,
    required this.name,
    this.idMembers,
    required this.idList,
    required this.badges,
    this.idLabel,
  });

  // Construtor que pega um Map e transforma em um objeto.
 factory CardRiai.fromMap(Map<String,dynamic> map){
    return CardRiai(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      idMembers: map['idMembers'].cast<String>(),
      idLabel: map['idLabels'].cast<String>(),
      idList: map['idList'] ?? '',
      badges: Badges.fromMap(map ['badges'] ?? ''),
      
    );
      
 }

 // Método que pega o json que é uma string e retorna um mapa do objeto
  factory CardRiai.fromJson(String json) => CardRiai.fromMap(jsonDecode(json));

// Método que pega o objeto e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'idMembers': idMembers,
      'idLabels': idLabel,
     'idList': idList,
     'badges': badges.toMap(),
      
    };
  }

  
 @override
  String toString() {
    return 'CardRiai(id: $id, name: $name, idMembers: $idMembers, idList: $idList, badges: $badges, idLabel: $idLabel)';
  }


}
