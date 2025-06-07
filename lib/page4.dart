import 'package:flutter/material.dart';

class StaggeredAnimationPage extends StatefulWidget {
  @override
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _heightAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<EdgeInsets> _paddingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _heightAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.ease),
      ),
    );

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.orange).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 0.7, curve: Curves.ease),
      ),
    );

    _paddingAnimation = EdgeInsetsTween(
      begin: EdgeInsets.only(left: 0),
      end: EdgeInsets.only(left: 100),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.7, 1.0, curve: Curves.ease),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: _paddingAnimation.value,
      alignment: Alignment.center,
      child: Container(
        height: _heightAnimation.value,
        width: 100,
        color: _colorAnimation.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: _buildAnimation,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => _controller.forward(from: 0),
      ),
    );
  }
}