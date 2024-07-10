import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodCategory.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyDivider.dart';
import 'package:fooddeliveryapp/screens/SubScreens/AddNewFood.dart';
import 'package:fooddeliveryapp/screens/SubScreens/OrderTime.dart';
import 'package:fooddeliveryapp/screens/SubScreens/SeeMore.dart';
import 'package:fooddeliveryapp/screens/SubScreens/change_role.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Admin Screen',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 110, 124, 148),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddNewFood(),
                        ),
                      );
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 86, 172, 89),
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'ADD NEW FOOD',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 110, 124, 148),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangeRole(),
                        ),
                      );
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 86, 172, 89),
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'CHANGE ROLE',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 110, 124, 148),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderTime(),
                        ),
                      );
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 86, 172, 89),
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: const Icon(
                        Icons.access_time_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'EDIT ORDER TIME',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 110, 124, 148),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: FoodsNonActive(),
          ),
          const SizedBox(height: 10),
          const MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Foods    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: DrinksNonActive(),
          ),
          const SizedBox(height: 10),
          const MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Drinks    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SnacksNonActive(),
          ),
          const SizedBox(height: 10),
          const MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Snacks    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const MyDivider(dividerHeight: 7, verticalSpace: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: DessertsNonActive(),
          ),
          const SizedBox(height: 10),
          const MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Desserts    ',
                numberOfCards: 1,
                adminActions: true,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
