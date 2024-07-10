import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/pages/SigninScreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 48, 41),
      body: SafeArea(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Image.asset(
                    'assets/images/startScreens/hat.png',
                    width: 90,
                  ),
                ),
                const Spacer(flex: 1),
                const Padding(
                  padding: EdgeInsets.only(right: 162),
                  child: Text(
                    'Food for',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    'Everyone',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Image.asset('assets/images/startScreens/cheese-burger.png'),
                const Spacer(flex: 1),
                SizedBox(
                  width: 320,
                  height: 50,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'N E X T',
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 48, 41),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
