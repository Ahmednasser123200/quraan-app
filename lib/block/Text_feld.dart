import 'package:flutter/material.dart';
class textfeld extends StatelessWidget {
  final String hint;
final TextEditingController mycontroller;

  const textfeld({super.key, required this.hint, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(width: 350,
        child: TextFormField(
          controller: mycontroller,
          decoration: InputDecoration(labelText: '$hint'),
        ));
  }
}
