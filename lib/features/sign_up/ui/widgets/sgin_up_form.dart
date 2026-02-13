import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/app_regex.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/widgets/app_text_form_field.dart';
import 'package:help_desktops/core/widgets/choix_mulitiple.dart';
import 'package:help_desktops/features/login/ui/widgets/password_validation.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowercase(passwordController.text);
        hasUppercase = AppRegex.hasUppercase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialChar(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: 'Username',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isValidUsername(value)) {
                return 'Please enter a valid username';
              }
            },
            controller: context.read<SignUpCubit>().usernameController,
          ),
          
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: 'First Name',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidUsername(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().firstNameController,
          ),
          spacingVertical(18),
          AppTextFormField(
            maxLines: 1,
            minLines: 1,
            hintText: 'Last Name',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidUsername(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().lastNameController,
          ),
          spacingVertical(18),
          ChoixMulitiple(
            controller: context.read<SignUpCubit>().roleController,
          ),
          spacingVertical(24),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialChar: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
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