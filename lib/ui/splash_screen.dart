import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xffe7f8fd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("imgs/oinx.png",height: MediaQuery.of(context).size.height/5,width: MediaQuery.of(context).size.width,)),
            Expanded(
              child: Column
                (mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Stack(
                    children: [


                      Image.asset("imgs/path1.png"),
                      Image.asset("imgs/motor.png"),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )

    );
  }
}


