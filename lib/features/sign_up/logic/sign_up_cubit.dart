
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/constants_keys.dart';
import 'package:help_desktops/core/helpers/flutter_shared_preference_helper.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/sign_up/data/models/sgin_up_request_body.dart';
import 'package:help_desktops/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  static const Map<String, String> userRoles = {
  'Employé': 'employe',
  'Technicien': 'technicien',
  'Administrateur': 'admin',
};
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void emitSignupStates() async {
    emit(const SignUpState.sginupLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: passwordConfirmationController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        role: roleController.text,
      ),
    );
    response.when(
      success: (data) async {
        await saveUserToken(data.access ?? '');
        await saveUserRole(data.user!.role);
        emit(SignUpState.sginupSuccess(data));
      },
      failure: (apiErrorsModel) => emit(
        SignUpState.sginupError(apiErrorsModel),
      ),
    );
  }
  Future<void> saveUserToken(String token) async {
    await FlutterSharedPreferenceHelper.setSecureToken(
        SharedPreferenceKeys.userToken, token);
  }
  Future<void> saveUserRole(String role) async {
    await FlutterSharedPreferenceHelper.setUserRole(SharedPreferenceKeys.userRole, role);
  }
  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    roleController.dispose();
    return super.close(); 
  }
}
