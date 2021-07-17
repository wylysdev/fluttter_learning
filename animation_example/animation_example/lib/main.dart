import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController =
      AnimationController.unbounded(vsync: this);

  late AnimationController _animationController2 =
      AnimationController.unbounded(vsync: this);

  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                _animationController2.value = details.delta.dy / 1000;
              },
              // onPanDown: (details) {
              //   _animationController2.animateWith(
              //     FrictionSimulation(
              //       0.05,
              //       _animationController2.value,
              //       details.localPosition.dx / 100,
              //     ),
              //   );
              // },
              // onPanStart: (details) {
              //   _animationController2.animateWith(
              //     FrictionSimulation(
              //       0.05,
              //       _animationController2.value,
              //       details.localPosition.dy / 100,
              //     ),
              //   );
              // },
              onVerticalDragEnd: (details) {
                _animationController2.animateWith(
                  FrictionSimulation(
                    0.05,
                    _animationController2.value,
                    details.velocity.pixelsPerSecond.dy / 100,
                  ),
                );
              },
              // onHorizontalDragEnd: (details) {
              //   _animationController2.animateWith(
              //     FrictionSimulation(
              //       0.05,
              //       _animationController2.value,
              //       details.velocity.pixelsPerSecond.dy / 100,
              //     ),
              //   );
              // },
              child: AnimatedBuilder(
                builder: (context, child) {
                  return Center(
                    child: Transform.rotate(
                      angle: _animationController2.value,
                      child: child,
                    ),
                  );
                },
                animation: _animationController2,
                child: Container(
                    child: FlutterLogo(
                  size: 300,
                )
                    //child: Image.asset("img/gun.png",filterQuality: FilterQuality.high, height: 500, width: 500,),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(image: AssetImage("img/gun.png")),
                    // ),
                    ),
              ),
            ),
          ),
          Container(
            //color: Colors.blueGrey,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  y = y - details.delta.dx / 100;
                  x = x + details.delta.dy / 100;
                  // _animationController.animateWith(
                  //   FrictionSimulation(
                  //     0.05,
                  //     _animationController.value,
                  //     details.velocity.pixelsPerSecond.dy / 100,
                  //   ),
                  // );
                });
              },
              child: AnimatedBuilder(
                builder: (context, child) {
                  return Transform(
                      child: child,
                      alignment: FractionalOffset.center,
                      transform: Matrix4(
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                      )
                        ..rotateX(x)
                        ..rotateY(y)
                        ..rotateZ(z));
                },
                animation: _animationController,
                child: FlutterLogo(size: 300,)
              ),
            ),
          )
        ],
      ),
    );
  }
}
