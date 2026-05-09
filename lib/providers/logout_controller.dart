import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/home_view_provider.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

final logoutControllerProvider = Provider((ref) {
  return LogoutController(ref);
});

class LogoutController {
  final Ref ref;

  LogoutController(this.ref);

  void logout() {
    DioHelper.setToken("");
    ref.read(tokenProvider.notifier).state = null;
    ref.read(bottomNavProvider.notifier).state = 0;
  }
}
