class WorkersEvents {}

class AddWorkers extends WorkersEvents {
  String? firstName;
  String? lastName;

  AddWorkers({this.firstName, this.lastName});
}

class GetEvent extends WorkersEvents {}
