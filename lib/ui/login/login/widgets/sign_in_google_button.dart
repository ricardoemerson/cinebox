import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/resources.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(R.ASSETS_IMAGES_GOOGLE_LOGO_PNG),
          ),
          Text(
            'Entrar com o Google',
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
