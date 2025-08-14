import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resources.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SizedBox.expand(
            child: ColoredBox(
              color: Colors.black.withAlpha(170),
            ),
          ),
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_LOGO_PNG,
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
