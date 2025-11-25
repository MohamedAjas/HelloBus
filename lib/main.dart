import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'views/auth/hello_bus_login_page.dart';
import 'views/auth/registration_page.dart';
import 'views/passenger/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HelloBusApp());
}

class HelloBusApp extends StatelessWidget {
  const HelloBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello Bus",
      theme: helloBusTheme,
      home: const HelloBusSplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(
              builder: (_) => const HelloBusLoginPage(),
              settings: settings,
            );
          case '/register':
            return MaterialPageRoute(
              builder: (_) => const HelloBusRegistrationPage(),
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}
