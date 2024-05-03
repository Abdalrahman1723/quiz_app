import 'package:flutter/material.dart';

//-----------------------------------------
class Question extends StatelessWidget {
  const Question({super.key, required this.questionText});

//--------------------------------
  final String questionText;

//--------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Card(
        elevation: 12,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Center(
            child: Text(
              questionText,
              style: const TextStyle(fontSize: 30, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
