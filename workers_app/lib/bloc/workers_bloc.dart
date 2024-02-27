import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers_app/bloc/workers_events.dart';
import 'package:workers_app/bloc/workers_states.dart';
import 'package:http/http.dart' as http;

class WorkersBloc extends Bloc<WorkersEvents, WorkersState> {
  WorkersBloc() : super(WorkersState()) {
    on<AddWorkers>((event, emit) async {
      String titleText = "title", descriptionText = "description";
      String title = event.firstName!;
      String description = event.lastName!;
      final body = {titleText: title, descriptionText: description};
      final response = await http.post(
          Uri.parse("https://api.nstack.in/v1/todos"),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        print("Successfully added new user");
      }
    });

    on<GetEvent>((event, emit) async {
      emit(WorkersState(loadingStatus: true));
      final response = await http
          .get(Uri.parse("https://api.nstack.in/v1/todos?page=1&limit=10"));
      if (response.statusCode == 200) {
        Map<String, dynamic> object = jsonDecode(response.body);
        List<dynamic> datas = object['items'];

        List<dynamic> items = datas.map((e) {
          return WorkersState.fromJson(e);
        }).toList();

        emit(WorkersState(data: items, loadingStatus: false));
      }
    });
  }
}
