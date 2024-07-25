import 'package:flutter/material.dart';

class LoginRow extends StatefulWidget {
  const LoginRow({super.key});

  @override
  State<LoginRow> createState() => _LoginRowState();
}

class _LoginRowState extends State<LoginRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 239, 48, 41),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          width: 100,
          height: 3,
        ),
      ],
    );
  }
}
