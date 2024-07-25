import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodCategory.dart';
import 'package:fooddeliveryapp/CustomWidgets/Search.dart';
import 'package:fooddeliveryapp/screens/SubScreens/CartScreen.dart';
import 'package:fooddeliveryapp/screens/SubScreens/SeeMore.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  Widget foods = const FoodsActive();
  Widget drinks = const DrinksNonActive();
  Widget snacks = const SnacksNonActive();
  Widget desserts = const DessertsNonActive();

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Widget food = const FoodBuilder(
    category: 'Foods    ',
    numberOfCards: 5,
    adminActions: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 27,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: const Text(
                textAlign: TextAlign.left,
                'Delicious',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: const Text(
                'Food For You',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: Search());
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '    Search',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 19),
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(162, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Foods    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.foods,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Drinks    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.drinks,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksActive();
                          widget.desserts = const DessertsNonActive();
                          food = const FoodBuilder(
                            category: 'Snacks    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.snacks,
                    ),
                    const SizedBox(width: 45),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.foods = const FoodsNonActive();
                          widget.drinks = const DrinksNonActive();
                          widget.snacks = const SnacksNonActive();
                          widget.desserts = const DessertsActive();
                          food = const FoodBuilder(
                            category: 'Desserts    ',
                            numberOfCards: 5,
                            adminActions: false,
                          );
                        });
                      },
                      child: widget.desserts,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeeMore(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 245),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'see more',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 239, 48, 41),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
                child: food,
              ),
            ),
            const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
