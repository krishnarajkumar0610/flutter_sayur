import 'dart:convert';

class WorkersState {
  String? title, description;
  List? data;
  bool? loadingStatus;

  WorkersState({this.title, this.description, this.data,this.loadingStatus});

  factory WorkersState.fromJson(Map<String, dynamic> jSon) {
    return WorkersState(title: jSon['title'], description: jSon['description']);
  }
}
