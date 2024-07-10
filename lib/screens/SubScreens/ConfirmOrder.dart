import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyTextfield.dart';
import 'package:fooddeliveryapp/auth/services/error_message.dart';

// ignore: must_be_immutable
class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({
    super.key,
    this.amount = 1,
    required this.foodName,
    required this.foodPrice,
    required this.image,
  });

  int? amount;
  final String image;
  final String foodName;
  final int foodPrice;

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  String? nameErrorText;
  String? phoneNumberErrorText;
  String? addressErrorText;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = screenHeight > screenWidth;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Container(
            width: isPortrait ? screenWidth * 0.9 : screenWidth * 0.6,
            height: isPortrait ? screenHeight * 0.7 : screenHeight * 0.85,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 9,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            Text(
                              widget.foodName.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'total price '
                              '${widget.foodPrice * widget.amount!}\$',
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 239, 48, 41),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'quantity',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 239, 48, 41),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.amount! > 1) {
                              setState(() {
                                widget.amount = widget.amount! - 1;
                              });
                            }
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/icons/minus.png',
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          widget.amount.toString(),
                          style: const TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 48, 41),
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.amount = widget.amount! + 1;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add_rounded),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      readOnly: false,
                      controller: name,
                      hintText: 'Name',
                      obscureText: false,
                      errorText: nameErrorText,
                    ),
                    MyTextField(
                      readOnly: false,
                      controller: phoneNumber,
                      hintText: 'Phone Number',
                      obscureText: false,
                      errorText: phoneNumberErrorText,
                      inputType: TextInputType.number,
                    ),
                    MyTextField(
                      readOnly: false,
                      controller: address,
                      hintText: 'Address',
                      obscureText: false,
                      errorText: addressErrorText,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: 39,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.amount = 1;
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 239, 48, 41),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: 39,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (name.text.isEmpty) {
                                    nameErrorText = 'this field is required';
                                  }
                                  if (phoneNumber.text.isEmpty) {
                                    phoneNumberErrorText =
                                        'this field is required';
                                  }
                                  if (address.text.isEmpty) {
                                    addressErrorText = 'this field is required';
                                  }
                                  setState(() {});
                                  if (name.text.isNotEmpty &&
                                      phoneNumber.text.isNotEmpty &&
                                      address.text.isNotEmpty) {
                                    try {
                                      int foodTotalPrice =
                                          widget.foodPrice * widget.amount!;
                                      int amount = widget.amount!;
                                      Random random = Random();
                                      int securityCode =
                                          100 + random.nextInt(900);
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.email)
                                          .collection('orders')
                                          .add({
                                        'foodName': widget.foodName,
                                        'foodTotalPrice': foodTotalPrice,
                                        'foodImage': widget.image,
                                        'name': name.text,
                                        'phoneNumber': phoneNumber.text,
                                        'address': address.text,
                                        'quantity': amount,
                                        'timeStamp': Timestamp.now(),
                                        'securityKey': securityCode.toString(),
                                        'email': FirebaseAuth
                                            .instance.currentUser!.email,
                                      });
                                      Navigator.pop(context);
                                    } catch (e) {
                                      message(context,
                                          title: 'error',
                                          content:
                                              'failed to complete order, please try again',
                                          buttonText: 'Ok', onPressed: () {
                                        Navigator.pop(context);
                                      });
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 45, 145, 25),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'complete order',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
