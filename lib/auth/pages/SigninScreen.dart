import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/LoginItem.dart';
import 'package:fooddeliveryapp/CustomWidgets/LoginRow.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyButton.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyTextfield.dart';
import 'package:fooddeliveryapp/auth/services/auth_gate.dart';
import 'package:fooddeliveryapp/auth/services/auth_service.dart';
import 'package:fooddeliveryapp/auth/services/error_message.dart';
import 'package:fooddeliveryapp/auth/pages/forget_password.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  final auth = AuthService();

  void SignIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
    );
    try {
      await auth.signIn(
          emailController.text.trim(), passwordController.text.trim());
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
        (route) => false,
      );
    } catch (e) {
      if (e.toString().contains('user-not-found')) {
        emailErrorText = 'user not found';
        setState(() {});
      } else if (e.toString().contains('wrong-password')) {
        passwordErrorText = 'wrong password';
        setState(() {});
      } else {
        message(
          context,
          title: 'error',
          content: e.toString(),
          buttonText: 'Ok',
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          LoginItem(row: const LoginRow()),
          const SizedBox(height: 30),
          MyTextField(
            readOnly: false,
            controller: emailController,
            hintText: 'Email Address',
            obscureText: false,
            errorText: emailErrorText,
          ),
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
            errorText: passwordErrorText,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Forget Password ?!',
                style: TextStyle(
                  color: Color.fromARGB(255, 239, 48, 41),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ForgetPasswordScreen();
                },
              ));
            },
          ),
          const SizedBox(height: 130),
          MyButton(
            color: const Color.fromARGB(255, 239, 48, 41),
            text: 'Sign In',
            onPressed: () {
              emailErrorText = auth.checkSigninCredential(
                credential: 'email',
                emailController: emailController,
                passwordController: passwordController,
              );
              passwordErrorText = auth.checkSigninCredential(
                credential: 'password',
                emailController: emailController,
                passwordController: passwordController,
              );

              setState(() {});
              if (auth.checkSigninCredential(
                    credential: 'signin',
                    emailController: emailController,
                    passwordController: passwordController,
                  ) ==
                  'valid signin') {
                SignIn();
              }
            },
          )
        ],
      ),
    );
  }
}
