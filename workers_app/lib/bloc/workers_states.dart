class WorkersState {
  String? title, description;
  List? data;


  WorkersState(
      {this.title, this.description, this.data, });

  factory WorkersState.fromJson(Map<String, dynamic> jSon) {
    return WorkersState(title: jSon['title'], description: jSon['description']);
  }
}
