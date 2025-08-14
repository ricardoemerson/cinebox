import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resources.dart';
import '../core/widgets/loader_and_message.dart';
import 'commands/check_user_logged_command.dart';
import 'splash_view_model.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (previous, next) {
      next.whenOrNull(
        loading: () {
          if (context.mounted) {
            showLoader();
          }
        },
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            _ => '',
          };

          hideLoader();

          if (path.isNotEmpty && context.mounted) {
            Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
          }
        },
        error: (error, stackTrace) {
          hideLoader();

          if (context.mounted) {
            showErrorSnackbar('Erro ao verificar login');
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          }
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
