import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_create_ticket_states.freezed.dart';

@freezed
class EmployeeCreateTicketStates with _$EmployeeCreateTicketStates {
  const factory EmployeeCreateTicketStates.initial() = _Initial;
  const factory EmployeeCreateTicketStates.loading() = Loading;
  const factory EmployeeCreateTicketStates.success(String message) = Success;
  const factory EmployeeCreateTicketStates.error({required String error}) = Error;

}