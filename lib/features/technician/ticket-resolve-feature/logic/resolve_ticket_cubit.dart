import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/technician/data/repos/ticket_repo.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/data/repos/ticket_resolve_repos.dart';
import 'resolve_ticket_state.dart';

class ResolveTicketCubit extends Cubit<ResolveTicketState> {
  final TicketResolveRepos _ticketResolveRepos;
  final TicketRepo _ticketRepo;

  ResolveTicketCubit(this._ticketResolveRepos, this._ticketRepo)
    : super(const ResolveTicketState.initial());

  Future<void> emitResolveTicketStates({
    required int ticketId,
    required String comment,
  }) async {
    emit(const ResolveTicketState.loading());

    final changeSatutTicket = await _ticketRepo.updateTicketStatus(
      ticketId,
      'ferme',
    );
    changeSatutTicket.when(
      success: (data) async {
        final response = await _ticketResolveRepos.addComment(
          ticketId,
          comment,
        );

        response.when(
          success: (data) {
            emit(ResolveTicketState.success("Ticket resolved successfully!"));
          },
          failure: (errorHandler) {
            emit(ResolveTicketState.error(error: errorHandler));
          },
        );
      },
      failure: (errorHandler) {
        emit(ResolveTicketState.error(error: errorHandler));
      },
    );
  }
}
