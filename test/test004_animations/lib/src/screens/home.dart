import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> flapAnimation;
  AnimationController flapController;

  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0, end: -80.0)
      .animate(
        CurvedAnimation(
          parent: catController,
          curve: Curves.easeIn,
        )
    ); // catAnimation

    flapController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    flapAnimation = Tween(begin: pi * 0.6, end: pi * 0.65)
      .animate(
        CurvedAnimation(
            parent: flapController,
            curve: Curves.easeInOut,
        )
    ); // flapAnimation

    flapAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        flapController.reverse();
      else if (status == AnimationStatus.dismissed)
        flapController.forward();
    });
    flapController.forward();
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      flapController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      flapController.stop();
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      top: 1.0,
      left: 3.0,
      child: AnimatedBuilder(
        animation: flapAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
              angle: flapAnimation.value,
              alignment: Alignment.topLeft,
              child: child,
          );
        },
      )
    );
  }

  Widget buildRightFlap() {
    return Positioned(
        top: 1.0,
        right: 3.0,
        child: AnimatedBuilder(
          animation: flapAnimation,
          child: Container(
            height: 10.0,
            width: 125.0,
            color: Colors.brown,
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: -flapAnimation.value,
              alignment: Alignment.topRight,
              child: child,
            );
          },
        )
    );
  }
}