import 'package:flutter/material.dart';
// import 'package:gift2grow/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Theme.of(context).colorScheme.primary, Colors.white])),
      child: const Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
       children: [
        Text("data")
       ],
      ),
      )
    );
  }
}