import 'package:flutter/material.dart';
import 'package:flutter_application_test/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // Identifies the widget/screen lifecycle. initState is called when the widget/screen is just created
  @override
  void initState() {

    // Delay/Sleep for 2 seconds and then go to HomeScree
    Future.delayed(Duration(seconds: 2), 
    () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()))

    );
    super.initState();
  }

  // Identifies the widget/screen lifecycle. dispose is called when we transition to new screen or widget is destroyed
  @override
  void dispose() {
    print('disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.flutter_dash, size: 100,),
      ),
    );
  }
}

