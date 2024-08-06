import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Widgets/FoodItem.dart';
import 'package:fooddeliveryapp/screens/SubScreens/DetailsScreen.dart';

// ignore: must_be_immutable
class FoodBuilder extends StatelessWidget {
  const FoodBuilder({
    super.key,
    required this.category,
    required this.numberOfCards,
    required this.adminActions,
  });

  final String category;
  final int numberOfCards;
  final bool adminActions;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(category)
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(color: Colors.grey[700]));
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No Foods found',
              style: TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
          );
        }

        List foods = snapshot.data!.docs;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foods.length <= 5
              ? foods.length
              : numberOfCards == 5
                  ? 5
                  : foods.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      foodName: foods[index]['foodName'],
                      foodPrice: foods[index]['foodPrice'],
                      image: foods[index]['foodImage'],
                      food: foods[index],
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  FoodItem(
                    food: foods[index],
                    category: category,
                    adminActions: adminActions,
                    cardHeight: 280,
                    cardWidth: 200,
                    imageSize: 150,
                    nameSize: 20,
                    priceSize: 14,
                    padding: 2,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
