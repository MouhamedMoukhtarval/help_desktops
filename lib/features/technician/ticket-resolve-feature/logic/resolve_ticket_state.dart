import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolve_ticket_state.freezed.dart';

@freezed
class ResolveTicketState with _$ResolveTicketState {
  const factory ResolveTicketState.initial() = _Initial;
  const factory ResolveTicketState.loading() = Loading;
  const factory ResolveTicketState.success(String message) = Success;
  const factory ResolveTicketState.error({required String error}) = Error;
}