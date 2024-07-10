import 'package:flutter/material.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory({
    super.key,
    required this.category,
    required this.icon,
    required this.onTap,
  });

  final String category;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(179, 33, 149, 243),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: icon,
                ),
                const SizedBox(width: 10),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(171, 63, 72, 87),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
