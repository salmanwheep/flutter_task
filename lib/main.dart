import 'package:flutter/material.dart';

import 'package:flutter_task/data/repository/auth_repository.dart';
import 'package:flutter_task/data/services/api/authApi.dart';
import 'package:flutter_task/data/services/api/order_api.dart';
import 'package:flutter_task/data/services/data_local/local_data_service.dart';
import 'package:flutter_task/ui/login/view/login_screen.dart';
import 'package:flutter_task/ui/login/view_models/login_viewmodels.dart';
import 'package:flutter_task/ui/order/view/order_page.dart';
import 'package:flutter_task/ui/order/view_models/order_viewmodels.dart';
import 'package:flutter_task/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/repository/order/order_repositry_local.dart';
import 'data/repository/order/order_response_remote.dart';

void main() {
  // debugPaintSizeEnabled=true;

  runApp(MultiProvider(
    providers: [


      Provider(create: (context) => LocalDataService()),
      Provider(create: (context) => OrderApi()),
      Provider(create: (context) => AuthApi()),
      Provider(create: (context) => OrderRepositoryLocal(localService: context.read<LocalDataService>())),
      Provider(create: (context) => OrderRepositoryRemote(orderApi: context.read<OrderApi>())),
      ChangeNotifierProvider(
          create: (context) => OrderViewModel(
            remoteRepository: context.read<OrderRepositoryRemote>(),
            localRepository: context.read<OrderRepositoryLocal>(),
          )),
      ChangeNotifierProvider(
        create: (context) =>
        AuthRepository(
          authApi: context.read<AuthApi>(),
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
        "/login":(context)=> loginScreen(viewModel: loginViewModels(authRepository: context.read())),
        "/orderPage":(context)=>OrderPage(viewModel: context.read(),),
      },
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          SplashScreen()
       // OrderPage(viewModel: context.read(),)
      // loginScreen(viewModel: loginViewModels(authRepository: context.read()))
    );
  }
}
