import 'dart:async';

import 'package:covid_19_tracker/screens/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 5),
    vsync: this
  )..repeat();
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const worldState()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              child: Container(
                height: 200,
                width: 200,
                child: Center(
                  child: Image.asset('assets/images/virus.png'),
                ),

              ),
                animation: _controller,
                builder: (BuildContext context, Widget? child){
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );

                }
            ),

            SizedBox(height: MediaQuery.of(context).size.height *.08,),

            Align(
              alignment: Alignment.center,
                child: Text('Covid-19\nTracker App',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)
            )
            
          ],
          
        ),
      ),
    );
  }
}
