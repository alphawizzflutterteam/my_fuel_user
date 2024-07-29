import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppbar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(100); // Adjust height as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(211, 83, 7, 1),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

class MyAppFinalbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppFinalbar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(100); // Adjust height as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(211, 83, 7, 1),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
