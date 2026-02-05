import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_button.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/logic/resolve_ticket_cubit.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/logic/resolve_ticket_state.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/ui/widgets/resolve_note_text_field.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/ui/widgets/ticket_card_resolve.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/ui/widgets/ticket_resolve_dialog_top_bar.dart';


class ResolveTicketDialog extends StatefulWidget {
  final TicketResponse ticket; // نمرر كائن التذكرة بالكامل

  const ResolveTicketDialog({super.key, required this.ticket});

  @override
  State<ResolveTicketDialog> createState() => _ResolveTicketDialogState();
}

class _ResolveTicketDialogState extends State<ResolveTicketDialog> {
  late TextEditingController _commentController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColorsManager.whiteSmoke,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. العنوان وزر الإغلاق
                TicketResolveDialogTopBar(
                  ticketTitle: widget.ticket.title ?? 'Untitled Ticket',
                  ticketId: widget.ticket.id ?? 0,
                ),
                
                spacingVertical(20),

                // 2. ملخص التذكرة
                TicketCardResolve(ticket: widget.ticket),

                spacingVertical(20),

                // 3. حقل إدخال الملاحظة
                ResolveNoteTextField(controller: _commentController),

                spacingVertical(24),

                // 4. زر الإرسال المربوط بالكيوبيت
                BlocConsumer<ResolveTicketCubit, ResolveTicketState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (message) {
                        context.pop(true); // إغلاق الديالوج
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message), backgroundColor: Colors.green),
                        );
                      },
                      error: (errorMessage) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
                        );
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return AppTextButton(
                      textStyle: AppTextStyles.font14GrayShadeMedium,
                      buttonText: 'Mark as Resolved',
                      isLoading: state is Loading, // إظهار التحميل
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // استدعاء المنطق
                          context.read<ResolveTicketCubit>().emitResolveTicketStates(
                                ticketId: widget.ticket.id!,
                                comment: _commentController.text,
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