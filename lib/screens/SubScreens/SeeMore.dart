import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodBuilder.dart';
import 'package:fooddeliveryapp/CustomWidgets/FoodCategory.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyDivider.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

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
              'All Available Foods',
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
      body: ListView(
        children: const [
          SizedBox(height: 10),
          SizedBox(height: 17),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: FoodsNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Foods    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DrinksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Drinks    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SnacksNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Snacks    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          MyDivider(dividerHeight: 7, verticalSpace: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: DessertsNonActive(),
          ),
          SizedBox(height: 10),
          MyContainer(
            childWidget: SizedBox(
              height: 270,
              child: FoodBuilder(
                category: 'Desserts    ',
                numberOfCards: 1,
                adminActions: false,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    required this.childWidget,
    super.key,
  });

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(10, 10),
          ),
        ],
      ),
      child: childWidget,
    );
  }
}
