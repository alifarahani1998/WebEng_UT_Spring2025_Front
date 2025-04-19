import 'package:flutter/material.dart';
import 'package:flutter_application_test/controller/http_request.dart';
import 'package:flutter_application_test/model/joke_model.dart';

class JokeScreen extends StatefulWidget {
  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  String jokeText = '';
  late Joke jokeData;

  Color color1 = Colors.red;
  Color color2 = Colors.blue;
  Color color3 = Colors.red;

  getData() async => jokeData = await HTTPRequest.fetchJoke();

  // Uncomment to see UI freezes when async is not used
  // getData() {
  //   for (int i = 0; i < 200; i++)
  //     HTTPRequest.fetchJoke();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Screen'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              jokeText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onPressed: () {
                getData();
                setState(() {
                  jokeText = jokeData.joke!;
                });
              },
              child: Text(
                'Tell me some joke!',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SizedBox(height: 100),
            InkWell(
              onTap:
                  () => setState(() {
                    color1 = color2;
                    color2 = color3;
                    color3 = color1;
                  }),
              child: Container(height: 200, width: 200, color: color1),
            ),
          ],
        ),
      ),
    );
  }
}
