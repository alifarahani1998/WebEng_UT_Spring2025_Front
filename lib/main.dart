import 'package:flutter/material.dart';
import 'package:weather_forecast/page1.dart';
import 'package:weather_forecast/page2.dart';
import 'package:weather_forecast/page3.dart';
import 'package:weather_forecast/page5.dart';


void main() {
  runApp(MyApp(
  ));
}


class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        fontFamily: 'iran_sans',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {
  final List<Map<String, Widget>> pages = [
    {'title': Text('AnimatedContainer'), 'page': AnimatedContainerPage()},
    {'title': Text('Explicit Animation'), 'page': BasicAnimationPage()},
    {'title': Text('Hero Animation'), 'page': HeroPage1()},
    {'title': Text('AnimatedSwitcher'), 'page': AnimatedSwitcherPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animations Workshop')),
      body: ListView(
        children: pages.map((item) {
          return ListTile(
            title: item['title'],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item['page']!),
            ),
          );
        }).toList(),
      ),
    );
  }
}
