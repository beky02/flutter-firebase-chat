import 'package:flutter/material.dart';

class DefualtAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  const DefualtAvatar(
      {Key? key, required this.firstName, required this.lastName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFF0F0F0), width: 2),
      ),
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: Colors.white,
        child: Center(
          child: Text(firstName.substring(0, 1) + lastName.substring(0, 1)),
        ),
      ),
    );
  }
}
