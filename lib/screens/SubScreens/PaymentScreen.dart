import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Widgets/MyButton.dart';
import 'package:fooddeliveryapp/Widgets/MyDivider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/back-icon.png',
                      width: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                const Text(
                  'CheckOut',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(right: 189),
              child: Text(
                'Payment',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 33,
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(right: 172),
              child: Text(
                'Payment Method',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 9.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Card',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffd35a01),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              'assets/icons/credit-card.png',
                            ),
                          ),
                        ),
                        const Text(
                          '  Card',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyDivider(dividerHeight: 1, verticalSpace: 0),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Bank Account',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffc62777),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'assets/icons/bank.png',
                            ),
                          ),
                        ),
                        const Text(
                          '  Bank Account',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(right: 172),
              child: Text(
                'Delivery Method',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 9.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Pick UP',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        const Text(
                          '  Pick UP',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyDivider(dividerHeight: 1, verticalSpace: 0),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Door Delivery',
                          groupValue: 'yes',
                          onChanged: (value) {},
                        ),
                        const Text(
                          '  Door Delivery',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 19,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  const Text(
                    'Total Price : ',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$totalPrice \$',
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              child: MyButton(
                color: const Color.fromARGB(255, 239, 48, 41),
                text: 'Proceed To Payment',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
