import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cinebox_main_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: CineboxMainApp(),
    ),
  );
}
