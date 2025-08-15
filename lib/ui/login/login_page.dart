import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resources.dart';
import '../core/widgets/loader_and_message.dart';
import 'commands/login_with_google_command.dart';
import 'login_view_model.dart';
import 'widgets/sign_in_google_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with LoaderAndMessage {
  @override
  Widget build(BuildContext context) {
    ref.listen(loginWithGoogleCommandProvider, (_, state) {
      state.whenOrNull(
        data: (_) {
          Navigator.pushReplacementNamed(context, '/home');
        },
        error: (error, stackTrace) {
          showErrorSnackbar('Erro ao realizar login.');
        },
      );
    });

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
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(loginWithGoogleCommandProvider);

                        return SignInGoogleButton(
                          onPressed: () {
                            final viewModel = ref.read(loginViewModelProvider);
                            viewModel.loginWithGoogle();
                          },
                          isLoading: state.isLoading,
                        );
                      },
                    ),
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
