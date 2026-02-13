import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/app_regex.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_form_field.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/ui/widgets/priorite_choix.dart';

class CreateTicketTextFields extends StatefulWidget {
  final TextEditingController titreController;
  final TextEditingController descriptionController;
  final TextEditingController priorityController;

  const CreateTicketTextFields({super.key, required this.titreController, required this.descriptionController, required this.priorityController});

  @override
  State<CreateTicketTextFields> createState() => _CreateTicketTextFieldsState();
}

class _CreateTicketTextFieldsState extends State<CreateTicketTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resolution Notes ', style: AppTextStyles.font16DarkBlueSemiBold),
        spacingVertical(15.h),
        AppTextFormField(
          controller: widget.titreController,
          hintText: 'Describe the steps taken to fix the issue\n',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isResolveMessageValid(value)) {
              return 'Please leave a note for the resolution (3-500 characters).';
            }
          },
        ),
        spacingVertical(15.h),
        AppTextFormField(
          controller: widget.descriptionController,
          hintText: 'Describe the issue in detail\n',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isResolveMessageValid(value)) {
              return 'Please enter a valid description.';
            }
          },
        ),
        spacingVertical(15.h),
        PrioriteChoix(
          prioriteController: widget.priorityController
        ),
      ],
    );
  }

  @override
  void dispose(){
    widget.titreController.dispose();
    widget.descriptionController.dispose();
    widget.priorityController.dispose();
    super.dispose();
  }
}
