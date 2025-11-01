import 'package:flutter/material.dart';
import 'package:flutter_task/data/services/authApi.dart';

import '../../../data/models/login_request.dart';
import '../view_models/login_viewmodels.dart';

class loginScreen extends StatelessWidget {
  const loginScreen();

  // final loginViewModel viewModel;

  // const loginScreen({required this.viewModel});
  // final loginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    AuthApi a=AuthApi();
    LoginRequest loginRequest=LoginRequest(deliveryNo: 1010,password: "0",languageNo: 2);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height/5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(

                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset('imgs/onx.png', fit: BoxFit.scaleDown),
                    ),
                  ),

                  Expanded(

                    child: Stack(
                      alignment: Alignment.centerRight,

                      clipBehavior: Clip.antiAlias,
                      children: [
                        Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 227, 58, 58),

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1000),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.language_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'WELCOME Back',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 79, 98),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    Text(
                      "log back into your account",

                      style: TextStyle(color: Color.fromARGB(255, 7, 139, 171)),
                    ),
                    SizedBox(height: 35),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEF0FC),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x00000000),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        textDirection: TextDirection.ltr,

                        decoration: InputDecoration(
                          labelText: 'User ID',
                          hintText: 'Enter your User ID',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEF0FC),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x00000000),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        textDirection: TextDirection.ltr,

                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your Password',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          'Show More',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 79, 98),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {

                        a.login( loginRequest)
                      },
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        ),

                        backgroundColor: WidgetStateProperty.all(
                          Color(0xFF004F62),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Flexible(child: Image.asset('imgs/delivery_truck.png')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
