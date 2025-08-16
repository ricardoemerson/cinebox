import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'cinebox_main_app.dart';
import 'config/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GoogleSignIn.instance.initialize(serverClientId: Env.googleApiKey);

  WakelockPlus.enable();

  runApp(
    ProviderScope(
      child: CineboxMainApp(),
    ),
  );
}
