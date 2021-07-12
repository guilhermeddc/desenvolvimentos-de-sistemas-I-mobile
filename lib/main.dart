import 'package:ds1/Managers/CityManager.dart';
import 'package:ds1/Managers/ClientManager.dart';
import 'package:ds1/Managers/UserManager.dart';
import 'package:ds1/screens/Login/LoginScreen.dart';
import 'package:ds1/screens/base/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => CityManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => ClientManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          appBarTheme: AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (context) => LoginScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (context) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
