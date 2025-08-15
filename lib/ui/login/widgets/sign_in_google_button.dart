import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/resources.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              child: Image.asset(R.ASSETS_IMAGES_GOOGLE_LOGO_PNG),
            ),
          ),
          Text(
            !isLoading ? 'Entrar com o Google' : 'Entrando...',
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
