import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedUIPage(),
    );
  }
}

class AnimatedUIPage extends StatefulWidget {
  @override
  _AnimatedUIPageState createState() => _AnimatedUIPageState();
}

class _AnimatedUIPageState extends State<AnimatedUIPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated UI'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://s1lkpay.com';
                  js.context.callMethod('open', [url]);
                  // if (!await launchUrl(Uri.parse(url))) {
                  //   print('Could not launch $url');
                  // }
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
