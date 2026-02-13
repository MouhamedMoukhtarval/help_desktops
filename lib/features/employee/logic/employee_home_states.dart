import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';
part 'employee_home_states.freezed.dart';

@freezed
class EmployeeHomeStates with _$EmployeeHomeStates {
  const factory EmployeeHomeStates.initial() = Initial;
  const factory EmployeeHomeStates.loading() = Loading;
  const factory EmployeeHomeStates.success({
    List<TicketEmployeeResponse?>? tickets,
    TicketDetails? tiketDetails,
    @Default('active') String selectedStatus,
    @Default('all') String selectedPriority,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) = Success;
  const factory EmployeeHomeStates.error(String? message) = Error;
}