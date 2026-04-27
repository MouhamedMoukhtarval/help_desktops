import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/networking/api_result.dart';

import 'package:help_desktops/features/employee/data/repos/employee_ticket_repo.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/logic/employee_create_ticket_states.dart';

class EmployeeCreateTicketCubit extends Cubit<EmployeeCreateTicketStates> {
  final EmployeeTicketRepo _repository;
  static const Map<String,String> priorities = {
    'High' : 'haute',
    'Medium' : 'moyenne',
    'Weak' : 'faible'
  };

  EmployeeCreateTicketCubit(this._repository)
      : super(EmployeeCreateTicketStates.initial());

  Future<void> createTicket({
    required String title,
    required String description,
    required String priority,
  }) async {
    emit(EmployeeCreateTicketStates.loading());
    try {
      final ticket =
          await _repository.creerTicket(
        title,
        description,
        priority,
      );
      ticket.when(
        success: (ticket) {
          emit(EmployeeCreateTicketStates.success('Ticket created successfully!'));
        },
        failure: (errorMessage) {
          emit(EmployeeCreateTicketStates.error(error: errorMessage));
        },
      );
    } catch (e) {
      emit(EmployeeCreateTicketStates.error(error: e.toString()));
    }
  }

}