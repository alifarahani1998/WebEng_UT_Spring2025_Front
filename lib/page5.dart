import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  bool _toggle = true;

  void _switch() => setState(() => _toggle = !_toggle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSwitcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _toggle
                  ? Text('Hello', key: ValueKey(1), style: TextStyle(fontSize: 32))
                  : Icon(Icons.star, key: ValueKey(2), size: 48, color: Colors.amber),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _switch, child: Text('Switch'))
          ],
        ),
      ),
    );
  }
}