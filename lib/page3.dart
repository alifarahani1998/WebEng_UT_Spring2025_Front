// HeroPage1
import 'package:flutter/material.dart';

class HeroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation - Page 1')),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HeroPage2())),
          child: Hero(
            tag: 'hero-image',
            child: Container(width: 100, height: 100, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}

// HeroPage2
class HeroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation - Page 2')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Container(width: 300, height: 300, color: Colors.purple),
        ),
      ),
    );
  }
}