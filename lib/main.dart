import 'package:flutter/material.dart';
import 'package:papb/screens/detail/detail_user_arguments.dart';
import 'package:papb/screens/detail/detail_user_screen.dart';
import 'package:papb/screens/home/home_screen.dart';
import 'package:papb/screens/login/login_screen.dart';
import 'package:papb/screens/register/register_screen.dart';

import 'constants/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      title: "My ITK",
      initialRoute: AppRoutes.login,
      onGenerateRoute: (settings) => configRoute(settings),
    );
  }

  Route? configRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return buildRoute(const LoginScreen(), settings: settings);
      case AppRoutes.register:
        return buildRoute(const RegisterScreen(), settings: settings);
      case AppRoutes.home:
        return buildRoute(const HomeScreen(), settings: settings);
      case AppRoutes.detailUser:
        final DetailUserArguments args =
            settings.arguments as DetailUserArguments;
        return buildRoute(DetailUserScreen(args), settings: settings);
      default:
        return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child,
          {required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      );
}
