import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/services/error_message.dart';
import 'package:fooddeliveryapp/screens/SubScreens/EditFood.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.imageSize,
    required this.nameSize,
    required this.priceSize,
    required this.padding,
    required this.food,
    required this.category,
    required this.adminActions,
  });

  final double cardHeight;
  final double cardWidth;
  final double imageSize;
  final double nameSize;
  final double priceSize;
  final double padding;
  final DocumentSnapshot? food;
  final String category;
  final bool adminActions;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  Future<void> deleteImage(String filePath) async {
    try {} catch (e) {
      print('Error occurred while deleting file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Container(
        height: widget.cardHeight,
        width: widget.cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 40,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Container(
              width: widget.imageSize,
              height: widget.imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 9,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: FancyShimmerImage(
                  imageUrl: widget.food!['foodImage'],
                  shimmerBaseColor: Colors.grey[300],
                  shimmerHighlightColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 190,
              child: Text(
                widget.food!['foodName'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: widget.nameSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.food!['foodPrice']} \$',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: widget.priceSize,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 239, 48, 41),
              ),
            ),
            const SizedBox(height: 7),
            widget.adminActions
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///////////   edit   ////////////
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditFood(
                                food: widget.food!,
                                category: widget.category,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 172, 159, 46),
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          child: const Icon(
                            Icons.edit_document,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            showCloseIcon: true,
                            title: 'Delete Warning',
                            desc: 'Do You Want To Delete This Food ?!',
                            btnCancelOnPress: () {},
                            btnOkColor: Colors.red,
                            btnCancelColor: Colors.green,
                            btnOkText: 'Delete',
                            btnOkOnPress: () async {
                              try {
                                await FirebaseFirestore.instance
                                    .collection(widget.category)
                                    .doc(widget.food!.id)
                                    .delete();
                                QuerySnapshot querySnapshot =
                                    await FirebaseFirestore.instance
                                        .collection('all Foods')
                                        .where('foodName',
                                            isEqualTo: widget.food!.id)
                                        .get();
                                querySnapshot.docs.forEach((doc) {
                                  doc.reference.delete();
                                });
                              } catch (e) {
                                message(
                                  context,
                                  title: 'error',
                                  content:
                                      'failed to delete food, please try again',
                                  buttonText: 'Ok',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                          ).show();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 78, 68),
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          child: const Icon(
                            Icons.delete_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
