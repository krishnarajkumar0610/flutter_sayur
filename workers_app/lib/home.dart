import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers_app/bloc/workers_bloc.dart';
import 'package:workers_app/bloc/workers_events.dart';
import 'package:workers_app/methods/special_methods.dart';
import 'package:workers_app/screens/new_user.dart';
import 'package:workers_app/widgets/master_card.dart';
import 'package:workers_app/widgets/wallet.dart';

import 'bloc/workers_states.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WorkersBloc>().add(GetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(
              Icons.menu,
              color: Colors.pink[400],
              size: 25,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<WorkersBloc>().add(GetEvent());
          },
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset("assets/background.png"),
                  Positioned(
                      left: 80,
                      child: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset("assets/user_profile.png"),
                        ),
                      )),
                  const Positioned(
                      left: 160,
                      top: 5,
                      child: Text(
                        "Adewale Taiwo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Positioned(
                      left: 160,
                      top: 40,
                      child: Text(
                        "House Manager",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.pink[400]),
                      )),
                  const Wallet(),
                  const MasterCard(),
                  SpecialMethod.positionedText("House",
                      size: 15, left: 20, top: 280),
                  Positioned(
                    top: 310,
                    left: 10,
                    child: Container(
                      width: 80,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 5),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SpecialMethod.space(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewUser(),
                                  ));
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              child: Icon(Icons.add),
                            ),
                          ),
                          SpecialMethod.space(height: 10),
                          SpecialMethod.text("Add", size: 15),
                          SpecialMethod.space(height: 3),
                          SpecialMethod.text("Workers", size: 15)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 300,
                      left: 100,
                      child: SizedBox(
                          width: 375,
                          height: 180,
                          child: BlocConsumer<WorkersBloc, WorkersState>(
                            listener: (context, state) {},
                            builder: (context, state) => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.datas?.length??0,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, bottom: 20, top: 10),
                                child: Container(
                                  width: 80,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 5),
                                          blurRadius: 5)
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      SpecialMethod.space(height: 20),
                                      CircleAvatar(
                                        backgroundColor: Colors.redAccent,
                                        child: Image.asset(
                                            "assets/user_profile.png"),
                                      ),
                                      SpecialMethod.space(height: 10),
                                      SpecialMethod.text("Add", size: 15),
                                      SpecialMethod.space(height: 3),
                                      SpecialMethod.text("Workers", size: 15)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))),
                  SpecialMethod.positionedText("Services",
                      top: 475, left: 15, size: 15),
                  SpecialMethod.positionedText("All",
                      top: 475, left: 330, size: 15, color: Colors.pinkAccent),
                  getButton(
                      text: "Electrician",
                      imagePath: "assets/electrician.png",
                      top: 510,
                      left: 30),
                  getButton(
                      text: "Others",
                      imagePath: "assets/menu.png",
                      top: 600,
                      left: 30)
                ],
              ),
            ],
          ),
        ));
  }

  Widget getButton(
      {required String text,
      required String imagePath,
      double? top,
      double? bottom,
      double? left,
      double? right}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
          width: 300,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 5)
            ],
          ),
          child: Row(
            children: [
              SpecialMethod.space(width: 80),
              SizedBox(width: 50, child: Image.asset(imagePath)),
              SpecialMethod.space(width: 5),
              SpecialMethod.text(text, size: 20)
            ],
          )),
    );
  }
}
