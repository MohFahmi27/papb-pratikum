import 'package:flutter/material.dart';
import 'package:papb/modules/home/screens/home_screen.dart';
import 'package:papb/utils/services/local_storage_service.dart';

import 'constants/app_routes.dart';
import 'modules/auth/screens/login/login_screen.dart';
import 'modules/auth/screens/register/register_screen.dart';
import 'modules/home/screens/detail/detail_user_arguments.dart';
import 'modules/home/screens/detail/detail_user_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initializePreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'OpenSans',
      ),
      title: "My ITK",
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialRoute(),
      onGenerateRoute: (settings) => configRoute(settings),
    );
  }

  String getInitialRoute() {
    if (LocalStorageService.getStateLogin()) {
      return AppRoutes.home;
    } else {
      return AppRoutes.login;
    }
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
