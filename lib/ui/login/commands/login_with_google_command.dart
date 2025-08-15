import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/result/result.dart';
import '../../../../data/repositories/repositories_providers.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();

    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signIn();

    switch (result) {
      case Success():
        state = AsyncData(null);
      case Failure():
        state = AsyncError(
          'Erro ao realizar o login, entre em contato com o suporte.',
          StackTrace.current,
        );
    }
  }
}
