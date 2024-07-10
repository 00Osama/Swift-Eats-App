import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyTextfield.dart';
import 'package:fooddeliveryapp/CustomWidgets/LoginItem.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyButton.dart';
import 'package:fooddeliveryapp/CustomWidgets/SignupRow.dart';
import 'package:fooddeliveryapp/auth/services/auth_service.dart';
import 'package:fooddeliveryapp/auth/pages/chooseProfilePhoto.dart';
import 'package:fooddeliveryapp/auth/services/error_message.dart';
import 'package:fooddeliveryapp/global_fields.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? fullNameErrorText;
  String? phoneNumberErrorText;
  String? emailErrorText;
  String? passwordErrorText;
  String? confirmPasswordErrorText;
  final auth = AuthService();

  Future<bool> userExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void signUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
    );

    try {
      bool exists = await userExists(emailController.text.trim());

      Navigator.pop(context);

      if (exists) {
        emailErrorText = 'This email is already in use';
        setState(() {});
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseProfilePhoto(),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      message(
        context,
        title: 'Error',
        content: e.toString(),
        buttonText: 'Ok',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          LoginItem(row: const SignUpRow()),
          const SizedBox(height: 30),
          MyTextField(
            readOnly: false,
            controller: fullNameController,
            hintText: 'Full Name',
            obscureText: false,
            errorText: fullNameErrorText,
          ),
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: phoneNumberController,
            hintText: 'Phone Number',
            obscureText: false,
            errorText: phoneNumberErrorText,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          MyTextField(
            readOnly: false,
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
            errorText: confirmPasswordErrorText,
          ),
          const SizedBox(height: 60),
          MyButton(
            color: const Color.fromARGB(255, 239, 48, 41),
            text: 'Sign Up',
            onPressed: () async {
              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    phoneNumberController: phoneNumberController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                  ) ==
                  'invalid signup') {
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                );
              }
              fullNameErrorText = await auth.checkSignUpCredential(
                credential: 'fullname',
                fullNameController: fullNameController,
                phoneNumberController: phoneNumberController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              );
              phoneNumberErrorText = await auth.checkSignUpCredential(
                credential: 'fullname',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              );
              emailErrorText = await auth.checkSignUpCredential(
                credential: 'email',
                fullNameController: fullNameController,
                phoneNumberController: phoneNumberController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              );
              passwordErrorText = await auth.checkSignUpCredential(
                credential: 'password',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              );

              confirmPasswordErrorText = await auth.checkSignUpCredential(
                credential: 'confirmPassword',
                fullNameController: fullNameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              );
              setState(() {});
              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    phoneNumberController: phoneNumberController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                  ) ==
                  'invalid signup') {
                Navigator.pop(context);
              }

              if (await auth.checkSignUpCredential(
                    credential: 'signup',
                    fullNameController: fullNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    phoneNumberController: phoneNumberController,
                    confirmPasswordController: confirmPasswordController,
                  ) ==
                  'valid signup') {
                signUp(context);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
