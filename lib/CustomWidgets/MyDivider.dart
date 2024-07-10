import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    required this.dividerHeight,
    required this.verticalSpace,
  });

  final double dividerHeight;
  final double verticalSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: verticalSpace),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: dividerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(113, 0, 0, 0),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: verticalSpace)
      ],
    );
  }
}
