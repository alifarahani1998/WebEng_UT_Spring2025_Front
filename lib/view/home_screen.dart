import 'package:flutter/material.dart';
import 'package:flutter_application_test/controller/flower_list_controller.dart';
import 'package:flutter_application_test/model/flower_model.dart';

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
      body: ListView.builder(
        itemCount: flowers.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(flowers[index].name),
              leading: Checkbox(
                value: flowers[index].isWatered,
                onChanged: (value) {
                  /* We want to refresh app state. SetState() does that. The widget must be stateful in order to use SetState()
                  Without this, the check marks would not change. Try this without SetState() to see! */
                  setState(() {
                    flowers[index].isWatered = flowerListController
                        .toggleFlowerWaterStatus(flowers[index].id, !value!);
                  });
                },
              ),
              trailing: Image.asset(flowers[index].imagePath),
            ),
      ),
    );
  }
}
