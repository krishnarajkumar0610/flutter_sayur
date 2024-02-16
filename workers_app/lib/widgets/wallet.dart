import 'package:flutter/material.dart';
import 'package:workers_app/methods/special_methods.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 20,
      child: Container(
        width: 150,
        height: 180,
        decoration: BoxDecoration(
            color: Colors.pink[50], borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            SpecialMethod.space(height: 29),
            SpecialMethod.text("Wallet Balance", color: Colors.black, size: 12),
            SpecialMethod.space(height: 5),
            SpecialMethod.text("\$5046.57", color: Colors.pink, size: 18),
            SpecialMethod.space(height: 10),
            SpecialMethod.text("Total Service", color: Colors.black, size: 12),
            SpecialMethod.space(height: 5),
            SpecialMethod.text("24", color: Colors.pink, size: 18),
          ],
        ),
      ),
    );
  }
}
