import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/app_regex.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/widgets/app_text_form_field.dart';
import 'package:help_desktops/features/login/logic/cubit/login_cubit.dart';
import 'package:help_desktops/features/login/ui/widgets/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool hasSpecialChar = false;
  @override
  void initState() {
    super.initState();
    usernameController = context.read<LoginCubit>().usernameController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowercase(passwordController.text);
        hasUppercase = AppRegex.hasUppercase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialChar(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: "Username",
            suffixIcon: Icon(Icons.person_outline),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidUsername(value)) {
                return 'Please enter a valid username';
              }
            },
            controller: context.read<LoginCubit>().usernameController,
          ),
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
          spacingVertical(24),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
            hasSpecialChar: hasSpecialChar,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
