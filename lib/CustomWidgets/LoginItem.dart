import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/pages/SigninScreen.dart';
import 'package:fooddeliveryapp/auth/pages/SignupScreen.dart';

// ignore: must_be_immutable
class LoginItem extends StatefulWidget {
  LoginItem({super.key, required this.row});

  Widget row;

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 246, 246),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 9,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Image.asset(
              'assets/images/startScreens/hat-removebg.png',
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 23),
            widget.row
          ],
        ),
      ),
    );
  }
}
