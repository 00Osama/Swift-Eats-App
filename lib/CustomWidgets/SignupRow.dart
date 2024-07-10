import 'package:flutter/material.dart';

class SignUpRow extends StatefulWidget {
  const SignUpRow({super.key});

  @override
  State<SignUpRow> createState() => _SignUpRowState();
}

class _SignUpRowState extends State<SignUpRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.only(left: 203),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 48, 41),
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
            width: 100,
            height: 3,
          ),
        )
      ],
    );
  }
}
