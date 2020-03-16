import 'package:flutter/cupertino.dart';

class Spend {

  int id;
  String description;
  int cost;
  String createdAt;

  Spend({this.id, this.description, this.cost, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      "description": this.description,
      "cost": this.cost,
      "created_at": getDateNow().toIso8601String()
    };
  }

  Spend fromDb(Map<String, dynamic> map) {
    return Spend(id: map['id'], description: map['desciption'], cost: map['cost'], createdAt: map['created_at']);
  }

  DateTime getDateNow() {
    return DateTime.now();
  }
}