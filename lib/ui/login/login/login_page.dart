import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/resources.dart';
import 'widgets/sign_in_google_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(top: 108),
              child: Column(
                spacing: 48,
                children: [
                  Image.asset(
                    R.ASSETS_IMAGES_LOGO_PNG,
                    width: 200,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SignInGoogleButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
