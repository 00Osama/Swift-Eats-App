import 'package:flutter/material.dart';

class FoodsActive extends StatefulWidget {
  const FoodsActive({super.key});

  @override
  State<FoodsActive> createState() => _FoodsActiveState();
}

class _FoodsActiveState extends State<FoodsActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Foods',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(255, 239, 48, 41),
      ),
    );
  }
}

class FoodsNonActive extends StatefulWidget {
  const FoodsNonActive({super.key});

  @override
  State<FoodsNonActive> createState() => _FoodsNonActiveState();
}

class _FoodsNonActiveState extends State<FoodsNonActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Foods',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(157, 0, 0, 0),
      ),
    );
  }
}

class DrinksActive extends StatefulWidget {
  const DrinksActive({super.key});

  @override
  State<DrinksActive> createState() => _DrinksActiveState();
}

class _DrinksActiveState extends State<DrinksActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Drinks',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(255, 239, 48, 41),
      ),
    );
  }
}

class DrinksNonActive extends StatefulWidget {
  const DrinksNonActive({super.key});

  @override
  State<DrinksNonActive> createState() => _DrinksNonActiveState();
}

class _DrinksNonActiveState extends State<DrinksNonActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Drinks',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(157, 0, 0, 0),
      ),
    );
  }
}

class SnacksActive extends StatefulWidget {
  const SnacksActive({super.key});

  @override
  State<SnacksActive> createState() => _SnacksActiveState();
}

class _SnacksActiveState extends State<SnacksActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Snacks',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(255, 239, 48, 41),
      ),
    );
  }
}

class SnacksNonActive extends StatefulWidget {
  const SnacksNonActive({super.key});

  @override
  State<SnacksNonActive> createState() => _SnacksNonActiveState();
}

class _SnacksNonActiveState extends State<SnacksNonActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Snacks',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(157, 0, 0, 0),
      ),
    );
  }
}

class DessertsActive extends StatefulWidget {
  const DessertsActive({super.key});

  @override
  State<DessertsActive> createState() => _DessertsActiveState();
}

class _DessertsActiveState extends State<DessertsActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Desserts  ',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(255, 239, 48, 41),
      ),
    );
  }
}

class DessertsNonActive extends StatefulWidget {
  const DessertsNonActive({super.key});

  @override
  State<DessertsNonActive> createState() => _DessertsNonActiveState();
}

class _DessertsNonActiveState extends State<DessertsNonActive> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Desserts  ',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        color: Color.fromARGB(157, 0, 0, 0),
      ),
    );
  }
}
