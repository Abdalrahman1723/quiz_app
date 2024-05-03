import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final int qIndex;
  final Function(int s) inc;
  const Welcome({super.key, required this.qIndex, required this.inc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/welcome.png",
            width: 350,
          ),
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              inc(0);
            },
            label: const Text(
              "get start",
              style: TextStyle(fontSize: 22, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

// navigateScreen(BuildContext ctx) {
//   Navigator.of(ctx).pushReplacement(MaterialPageRoute(
//     builder: (_) {
//       return null;
//     },
//   ));
// }
