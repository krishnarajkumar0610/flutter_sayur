import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers_app/bloc/workers_events.dart';
import 'package:workers_app/bloc/workers_states.dart';
import 'package:http/http.dart' as http;

class WorkersBloc extends Bloc<WorkersEvents, WorketsState> {
  WorkersBloc() : super(WorketsState()) {
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
  }
}
