import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

// AUTH SCREENS
import 'views/auth/hello_bus_login_page.dart';
import 'views/auth/registration_page.dart';

// SPLASH SCREEN
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

      /// APP START SCREEN
      home: const HelloBusSplashScreen(),

      // APP ROUTES
      routes: {
        '/login': (_) => const HelloBusLoginPage(),
        '/register': (_) => const HelloBusRegistrationPage(),
      },
    );
  }
}
