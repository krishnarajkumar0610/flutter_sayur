import 'dart:convert';

class WorkersState {
  String titleText = "title", descriptionText = "description";
  String? title, description;
  List? datas;

  WorkersState({this.title, this.description, this.datas});

  factory WorkersState.fromJson(Map<String, dynamic> jSon) {
    return WorkersState(title: jSon['title'], description: jSon['description']);
  }
}
