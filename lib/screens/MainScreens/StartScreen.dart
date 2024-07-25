import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/pages/SigninScreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 48, 41),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return Center(
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.6),
                    child: Image.asset(
                      'assets/images/startScreens/hat.png',
                      width: screenWidth * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.45),
                    child: Text(
                      'Food for',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.45),
                    child: Text(
                      'Everyone',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Image.asset(
                    'assets/images/startScreens/cheese-burger.png',
                    width: screenWidth * 0.9,
                  ),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'N E X T',
                        style: TextStyle(
                          color: Color.fromARGB(255, 239, 48, 41),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
