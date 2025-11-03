import 'package:flutter/material.dart';

import 'package:flutter_task/data/repository/auth_repository.dart';
import 'package:flutter_task/data/services/api/authApi.dart';
import 'package:flutter_task/ui/login/view/login_screen.dart';
import 'package:flutter_task/ui/login/view_models/login_viewmodels.dart';
import 'package:flutter_task/ui/order/view/order_page.dart';
import 'package:provider/provider.dart';

void main() {
  // debugPaintSizeEnabled=true;

  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => AuthApi()),
      ChangeNotifierProvider(
        create: (context) =>
        AuthRepository(
          authApi: context.read(),
        ),
      ),

    ],
  child:  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
      {
        // "/":(context)=> loginScreen(viewModel: loginViewModels(authRepository: context.read()))
      },
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
       OrderPage()
      // loginScreen(viewModel: loginViewModels(authRepository: context.read()))
    );
  }
}
