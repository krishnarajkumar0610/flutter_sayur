import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers_app/bloc/workers_bloc.dart';
import 'package:workers_app/bloc/workers_events.dart';
import 'package:workers_app/methods/special_methods.dart';

import '../bloc/workers_states.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  Widget textField({TextEditingController? controller, String? text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: text,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SpecialMethod.text("ADD NEW USER PAGE", color: Colors.pink),
      ),
      body: BlocConsumer<WorkersBloc, WorkersState>(
        listener: (context, state) {},
        builder: (context, state) => ListView(
          children: [
            Column(
              children: [
                SpecialMethod.space(height: 150),
                textField(controller: firstName, text: "First Name"),
                SpecialMethod.space(
                  height: 30,
                ),
                textField(controller: lastName, text: "Last Name"),
                SpecialMethod.space(height: 70),
                GestureDetector(
                  onTap: () {
                    context.read<WorkersBloc>().add(AddWorkers(
                        firstName: firstName.text, lastName: lastName.text));
                    firstName.dispose();
                    lastName.dispose();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pinkAccent),
                    child: Center(
                      child: SpecialMethod.text("SUBMIT USER", size: 20),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
