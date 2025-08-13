import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  void showAlertDialogException({required Exception exception}) {
    // Implement your alert dialog display logic here
  }

  void showMessage(String message) {
    // Implement your message display logic here
  }
}
