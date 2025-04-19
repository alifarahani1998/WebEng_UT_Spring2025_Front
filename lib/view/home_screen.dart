import 'package:flutter/material.dart';
import 'package:flutter_application_test/controller/flower_list_controller.dart';
import 'package:flutter_application_test/model/flower_model.dart';
import 'package:flutter_application_test/view/joke_screen.dart';
import 'package:flutter_application_test/view/mobile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Creates a list of flower objects/models statically (we usually get these by APIs)
  final List<FlowerModel> flowers = [
    FlowerModel(
      age: 12,
      id: 0,
      isWatered: false,
      name: 'shabnam',
      imagePath: 'assets/images/shabnam.jpg',
    ),
    FlowerModel(
      age: 10,
      id: 1,
      isWatered: true,
      name: 'yas',
      imagePath: 'assets/images/yas.jpg',
    ),
    FlowerModel(
      age: 5,
      id: 2,
      isWatered: true,
      name: 'narges',
      imagePath: 'assets/images/narges.jpg',
    ),
  ];

  // Creates an object from controller to use controller logic functions
  FlowerListController flowerListController = new FlowerListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: flowers.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.orange, width: 4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Text(flowers[index].name),
                    leading: Checkbox(
                      value: flowers[index].isWatered,
                      onChanged: (value) {
                        /* We want to refresh app state. SetState() does that. The widget must be stateful in order to use SetState()
                        Without this, the check marks would not change. Try this without SetState() to see! */
                        setState(() {
                          flowers[index].isWatered = flowerListController
                              .toggleFlowerWaterStatus(
                                flowers[index].id,
                                !value!,
                              );
                        });
                      },
                    ),
                    trailing: Image.asset(flowers[index].imagePath),
                    minVerticalPadding: 10,
                  ),
                ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JokeScreen()),
                        ),
                    child: Text(
                      'Go to joke screen',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 20),
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
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileScreen(),
                          ),
                        ),
                    child: Text(
                      'Go to mobile screen',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
