// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Members {
  String id;
  String fullName;

  Members({
    required this.id,
    required this.fullName,
  });

  // Construtor que pega um Map e transforma em um objeto.
  factory Members.fromMap(Map<String, dynamic> map) {
    return Members(
      id: map['id'] ?? '',
      fullName: map ['fullName'] ?? '',
    );
  }

  // Método que pega o json que é uma string e retorna um mapa do objeto
  factory Members.fromJson(String json) => Members.fromMap(jsonDecode(json));

  // Método que pega o objeto e transforma em um Map<String, dynamic>
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'fullName': fullName,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'Members(id: $id, fullName: $fullName)';
  }
}
