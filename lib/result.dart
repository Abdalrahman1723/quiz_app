import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/model_answer.dart';

//-----------------------------------------
class Result extends StatelessWidget {
  final int? result;

//---------------------------
  final Function() reset;

  const Result({super.key, required this.reset, this.result});

//---------------------------

//---------------------------

  String get resultText {
    String text;
    if (result! > 80) {
      text = "you are great";
    } else if (result! > 60) {
      text = "you are good";
    } else if (result! >= 50) {
      text = "you are bad";
    } else {
      text = "جاموسة";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              resultText,
              style: const TextStyle(fontSize: 30),
            ),
            //-----------------------------------------------------

            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 13.0,
              animation: true,
              percent: (result! > 100 ? 100 : result!) / 100,
              center: Text(
                "${result!}%",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: Text(
                "Your score $result",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),

            //-----------------------------------
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 15,
                shadowColor: Colors.black,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.pink,
                          Colors.red.withOpacity(0.83)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      //list tile
                      onTap: reset,
                      trailing: const Icon(Icons.restart_alt),
                      title: const Text(
                        "Restart the app",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
            //--------------------------------show
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 15,
                shadowColor: Colors.black,
                child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.blue,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      //list tile
                      onTap: () => selectScreenMain(
                          context), //?------------------------//
                      trailing: const Icon(Icons.lightbulb),
                      title: const Text(
                        "Show Answers",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

selectScreenMain(BuildContext ctx) {
  //navigate the screens
  Navigator.of(ctx).push(MaterialPageRoute(
    builder: (_) {
      return Model();
    },
  ));
}
