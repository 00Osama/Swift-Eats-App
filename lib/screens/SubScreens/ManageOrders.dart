import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Colors.grey[700]));
          }

          var userData = snapshot.data?.data();

          if (userData == null) {
            return const Center(
              child: Text(
                'No Data Found',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'driver orders',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        userData['orders'].toString(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'driver salary',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        ((userData['orders'] * userData['salaryPerOrder'])
                                .toString())
                            .toString(),
                        style: const TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
