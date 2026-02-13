import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/constants_keys.dart';
import 'package:help_desktops/core/helpers/flutter_shared_preference_helper.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/core/networking/dio_factory.dart';
import 'package:help_desktops/features/login/data/models/login_request_body.dart';
import 'package:help_desktops/features/login/data/repos/login_repo.dart';
import 'package:help_desktops/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoadingStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.access ?? '');
        await saveUserRole(loginResponse.user!.role);
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (apiErrorsModel) {
        emit(LoginState.loginError(apiErrorsModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await FlutterSharedPreferenceHelper.setSecureToken(
      SharedPreferenceKeys.userToken,
      token,
    );
  }

  Future<void> saveUserRole(String role) async {
    await FlutterSharedPreferenceHelper.setUserRole(
      SharedPreferenceKeys.userRole,
      role,
    );
  }
}
