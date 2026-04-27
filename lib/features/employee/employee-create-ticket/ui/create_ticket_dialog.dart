import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_button.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/logic/employee_create_ticket_cubit.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/logic/employee_create_ticket_states.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/ui/widgets/create_ticket_dialog_top_bar.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/ui/widgets/create_ticket_text_fields.dart';

class CreateTicketDialog extends StatefulWidget {
  const CreateTicketDialog({super.key});

  @override
  State<CreateTicketDialog> createState() => _CreateTicketDialogState();
}

class _CreateTicketDialogState extends State<CreateTicketDialog> {
  late TextEditingController _titreController;
  late TextEditingController _descriptionCntroller;
  late TextEditingController _priorityController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titreController = TextEditingController();
    _descriptionCntroller = TextEditingController();
    _priorityController = TextEditingController();
  }

  @override
  void dispose() {
    _titreController.dispose();
    _descriptionCntroller.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColorsManager.whiteSmoke,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CreateTicketDialogTopBar(),

                spacingVertical(20),
                CreateTicketTextFields(
                  titreController: _titreController,
                  descriptionController: _descriptionCntroller,
                  priorityController: _priorityController,
                ),

                spacingVertical(24),

                BlocConsumer<
                  EmployeeCreateTicketCubit,
                  EmployeeCreateTicketStates
                >(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (message) {
                        context.pop(true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      error: (errorMessage) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return AppTextButton(
                      textStyle: AppTextStyles.font14GrayShadeMedium,
                      buttonText: 'Create',
                      isLoading: state is Loading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<EmployeeCreateTicketCubit>()
                              .createTicket(
                                title: _titreController.text,
                                description: _descriptionCntroller.text,
                                priority: _priorityController.text,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
