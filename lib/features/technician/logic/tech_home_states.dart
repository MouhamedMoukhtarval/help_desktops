import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
part 'tech_home_states.freezed.dart';

@freezed
class TechHomeStates with _$TechHomeStates {
    const factory TechHomeStates.initial() = Initial;
    const factory TechHomeStates.loading() = Loading;
    const factory TechHomeStates.success({
      required List<TicketResponse> tickets,
      @Default('active') String selectedStatus,
      @Default('all') String selectedPriority,
      DateTime? dateFrom,
      DateTime? dateTo,
    }) = Success;
    const factory TechHomeStates.error(String? message) = Error;
}