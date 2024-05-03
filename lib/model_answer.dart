import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  const Model({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Answers"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/quiz.jpg"),
                fit: BoxFit.cover)),
        child: const SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
