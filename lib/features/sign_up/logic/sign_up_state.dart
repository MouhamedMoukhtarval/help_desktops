import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help_desktops/features/sign_up/data/models/sign_up_response.dart';
part 'sign_up_state.freezed.dart';
@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.sginupLoading() = SignupLoading;
  const factory SignUpState.sginupSuccess(SignUpResponseBody signupRB) = SignupSuccess;
  const factory SignUpState.sginupError(String apiErrorsModel) = SginupError;
}