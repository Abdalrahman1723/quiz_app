import 'package:flutter/material.dart';

//-----------------------------------------
class Answer extends StatelessWidget {
  //---------------------------
  final String? answerText;

  final Function() answerFunc;

  //---------------------------
  const Answer({super.key, this.answerText, required this.answerFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(33)),
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: answerFunc,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.green)),
        child: Text(
          answerText!,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
