import 'package:flutter/material.dart';

import 'ui/core/themes/theme.dart';
import 'ui/splash/splash_page.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinebox',
      theme: AppTheme.theme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
