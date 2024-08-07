import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/screens/SubScreens/DetailsScreen.dart';

class Search extends SearchDelegate {
  Future<List<DocumentSnapshot>> searchAllCollections(String searchTerm) async {
    List<QuerySnapshot> snapshots = await Future.wait([
      FirebaseFirestore.instance.collection('Foods    ').get(),
      FirebaseFirestore.instance.collection('Drinks    ').get(),
      FirebaseFirestore.instance.collection('Snacks    ').get(),
      FirebaseFirestore.instance.collection('Desserts    ').get(),
    ]);

    List<DocumentSnapshot> results = [];
    snapshots.forEach((snapshot) {
      results.addAll(snapshot.docs);
    });

    String queryLowerCase = searchTerm.toLowerCase();
    List<DocumentSnapshot> filteredResults = results.where((doc) {
      String foodName = doc['foodName'].toString().toLowerCase();
      return foodName.startsWith(queryLowerCase);
    }).toList();

    return filteredResults;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.cancel_rounded),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Image.asset(
          'assets/icons/back-icon.png',
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/search food.png',
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'you can search foods',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Ubuntu',
            ),
          ),
        ],
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: FutureBuilder(
          future: searchAllCollections(query),
          builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[700],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            List<DocumentSnapshot> filterFoods = snapshot.data ?? [];

            if (filterFoods.isEmpty) {
              return const Center(
                child: Text(
                  'No Foods found',
                  style: TextStyle(fontFamily: 'Ubuntu'),
                ),
              );
            }

            return ListView.builder(
              itemCount: filterFoods.length,
              itemBuilder: (context, index) {
                DocumentSnapshot food = filterFoods[index];
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          foodName: food['foodName'],
                          foodPrice: food['foodPrice'],
                          image: food['foodImage'],
                          food: food,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 85,
                              height: 85,
                              child: ClipOval(
                                child: FancyShimmerImage(
                                  imageUrl: food['foodImage'],
                                  shimmerBaseColor: Colors.grey[300],
                                  shimmerHighlightColor: Colors.white,
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food['foodName'],
                                  style: const TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 24, 11, 11),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  food['foodPrice'] + ' ' + '\$',
                                  style: const TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 239, 48, 41),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    }
  }
}
