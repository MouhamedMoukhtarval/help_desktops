import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help_desktops/features/login/data/models/login_response.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(LoginResponseBody loginRB) = LoginSuccess;
  const factory LoginState.loginError(String apiErrorModel) =
      LoginError;
}
