import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/colors.dart';

mixin LoaderAndMessage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpened = false;

  void showLoader() {
    if (!isOpened) {
      isOpened = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 60,
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpened) {
      isOpened = false;
      Navigator.of(context).pop();
    }
  }

  void showErrorSnackbar(String message) => _showMessage(message, AppColors.red);

  void showSuccessSnackbar(String message) => _showMessage(message, Colors.green);

  void showInfoSnackbar(String message) => _showMessage(message, Colors.lightBlue);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
