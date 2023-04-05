import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String uid;
  const HomePage({
    required this.uid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
