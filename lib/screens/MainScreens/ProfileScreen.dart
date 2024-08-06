import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Widgets/ProfileCategory.dart';
import 'package:fooddeliveryapp/screens/SubScreens/AccountInfo.dart';
import 'package:fooddeliveryapp/screens/SubScreens/ManageDrivers.dart';
import 'package:fooddeliveryapp/screens/SubScreens/Settings.dart';

class ProFileScrren extends StatelessWidget {
  const ProFileScrren({
    super.key,
    required this.accountType,
  });

  final String? accountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            '$accountType profile',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 110, 124, 148),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.grey[700],
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                var userData = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10000),
                        child: Image.network(
                          userData['profileImage'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userData['FullName'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 72, 87),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //////////////////////////////////////////////////////////////////////
                    accountType == 'driver'
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                        ((userData['orders'] *
                                                    userData['salaryPerOrder'])
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
                          )
                        : SizedBox(),
                    //////////////////////////////////////////////////////////////////////
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            ProfileCategory(
              category: 'Account Info',
              icon: Icon(Icons.person_rounded, color: Colors.grey[100]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountInfo(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ProfileCategory(
              category: 'Settings',
              icon: Icon(Icons.settings_rounded, color: Colors.grey[100]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => settings(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            //////////////////////////////////////////////////////////////////////
            accountType == 'admin'
                ? ProfileCategory(
                    category: 'Manage Drivers',
                    icon: Icon(Icons.delivery_dining, color: Colors.grey[100]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManageDrivers(),
                        ),
                      );
                    },
                  )
                : SizedBox(),
            //////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
