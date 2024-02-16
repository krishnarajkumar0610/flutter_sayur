import 'package:flutter/material.dart';

class MasterCard extends StatelessWidget {
  const MasterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 190,
      child: Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50.0, top: 20),
                child: Text(
                  "Master Card",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.0, top: 20),
                child: Text(
                  "5999-XXXX",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.0, top: 5),
                child: Text(
                  "Adewale T.",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
