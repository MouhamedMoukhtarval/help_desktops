import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/app_regex.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_form_field.dart';

class ResolveNoteTextField extends StatelessWidget {
  final TextEditingController controller;

  const ResolveNoteTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resolution Notes ', style: AppTextStyles.font16DarkBlueSemiBold),
        spacingVertical(15.h),
        AppTextFormField(
          controller: controller,
          hintText: 'Describe the steps taken to fix the issue\n',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isResolveMessageValid(value)) {
              return 'Please leave a note for the resolution (3-500 characters).';
            }
          },
        ),
      ],
    );
  }
}
