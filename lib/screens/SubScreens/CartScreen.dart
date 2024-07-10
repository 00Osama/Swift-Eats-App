import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/CartBuilder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/icons/back-icon.png',
              width: 15,
            ),
          ),
        ),
        title: const Row(
          children: [
            Spacer(flex: 1),
            Text(
              'Cart Items',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 110, 124, 148),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/flick-to-left.png',
                  width: 18,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Swipe The Item For More Details',
                  style: TextStyle(fontFamily: 'Ubuntu'),
                ),
              ],
            ),
            const Expanded(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: CartBuilder(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
