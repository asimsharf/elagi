import 'package:flutter/material.dart';

import '../utils/appStyles.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation heartbeatAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    heartbeatAnimation =
        Tween<double>(begin: 100.0, end: 150.0).animate(controller);
    controller.forward().whenComplete(() {
      controller.reverse();
    });
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacementNamed('/Login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heartbeatAnimation,
      builder: (ctx, widget) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/logo_transparent.png',
                  height: heartbeatAnimation.value,
                  width: heartbeatAnimation.value,
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Text("1.0.0", style: AppStyles.txtBtnStyle),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
