import 'package:flutter/material.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tablet')),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, //<---- Insert Gradient Here
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 70,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.red,
                    child: Text(
                      'Main Movie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder:
                            (context, index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              color: Colors.blue,
                              child: Text(
                                'Comment ${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder:
                        (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          color: Colors.green,
                          child: Text(
                            'Move ${index + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
