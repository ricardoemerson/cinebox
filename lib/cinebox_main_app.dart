import 'package:flutter/material.dart';

import 'ui/core/themes/theme.dart';
import 'ui/home/home_page.dart';
import 'ui/login/login_page.dart';
import 'ui/splash/splash_page.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinebox',
      theme: AppTheme.theme,
      navigatorKey: navKey,
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
