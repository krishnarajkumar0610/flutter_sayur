import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers_app/bloc/workers_events.dart';
import 'package:workers_app/bloc/workers_states.dart';

class WorkersBloc extends Bloc<WorkersEvents, WorketsState> {
  WorkersBloc() : super(WorketsState()) {
    on<AddWorkers>((event, emit) async{
      //final response = await
    });
  }
}
