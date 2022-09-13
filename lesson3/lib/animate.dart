import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_animations/im_animations.dart';

class Animate extends StatefulWidget {
  const Animate({super.key});

  @override
  State<Animate> createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  bool isWork = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isWork = !isWork;
                  });
                },
                child: Text("Change")),
            AnimatedOpacity(
              opacity: isWork ? 0.75 : 0.25,
              duration: Duration(milliseconds: 500),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text("Ok"),
              ),
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              crossFadeState:
                  isWork ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text("Ok"),
              ),
              secondChild: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text("Two"),
              ),
            ),
            ColorSonar(
              // wavesDisabled: true,
              // waveMotion: WaveMotion.synced,
              contentAreaRadius: 90.0,

              waveFall: 5.0,
              waveMotionEffect: Curves.elasticIn,
              waveMotion: WaveMotion.synced,
              // duration: Duration(seconds: 5),
              child: FlutterLogo(),
            ),
            AnimatedAlign(
              alignment: isWork ? Alignment.center : Alignment.topCenter,
              duration: Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                height: isWork ? 100 : 200,
                color: isWork ? Colors.amber : Colors.red,
                alignment: isWork ? Alignment.center : Alignment.topCenter,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isWork = !isWork;
                      });
                    },
                    child: Text("Hello")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
