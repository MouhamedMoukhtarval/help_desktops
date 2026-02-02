import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
import 'package:help_desktops/features/technician/data/repos/ticket_repo.dart';
import 'package:help_desktops/features/technician/logic/tech_home_states.dart';

class TechnicianHomeCubit extends Cubit<TechHomeStates> {
  final TicketRepo _repository;

  TechnicianHomeCubit(this._repository) 
      : super(const TechHomeStates.initial()) {
    loadTickets();
  }

  // ========== Load Tickets ==========
  Future<void> loadTickets() async {
    emit(const TechHomeStates.loading());

    final result = await _repository.getTickets();

    result.when(
      success: (tickets) {
        final now = DateTime.now();
        final startOfDay = DateTime(now.year, now.month, now.day);
        final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

        emit(TechHomeStates.success(
          tickets: tickets,
          selectedStatus: 'active',
          selectedPriority: 'all',
          dateFrom: startOfDay,
          dateTo: endOfDay,
        ));
      },
      failure: (message) {
        emit(TechHomeStates.error(message));
      },
    );
  }

  // ========== Refresh ==========
  Future<void> refresh() async {
    final result = await _repository.getTickets();

    result.when(
      success: (tickets) {
        state.maybeWhen(
          success: (_, selectedStatus, selectedPriority, dateFrom, dateTo) {
            emit(TechHomeStates.success(
              tickets: tickets,
              selectedStatus: selectedStatus,
              selectedPriority: selectedPriority,
              dateFrom: dateFrom,
              dateTo: dateTo,
            ));
          },
          orElse: () {},
        );
      },
      failure: (message) {
        emit(TechHomeStates.error(message));
      }
    );
  }

  // ========== Filters ==========
  void selectStatus(String status) {
    state.maybeWhen(
      success: (tickets, _, selectedPriority, dateFrom, dateTo) {
        emit(TechHomeStates.success(
          tickets: tickets,
          selectedStatus: status,
          selectedPriority: selectedPriority,
          dateFrom: dateFrom,
          dateTo: dateTo,
        ));
      },
      orElse: () {},
    );
  }

  void setPriorityFilter(String filter) {
    state.maybeWhen(
      success: (tickets, selectedStatus, _, dateFrom, dateTo) {
        emit(TechHomeStates.success(
          tickets: tickets,
          selectedStatus: selectedStatus,
          selectedPriority: filter,
          dateFrom: dateFrom,
          dateTo: dateTo,
        ));
      },
      orElse: () {},
    );
  }

  void setDateFilter(DateTime? from, DateTime? to) {
    state.maybeWhen(
      success: (tickets, selectedStatus, selectedPriority, _, _) {
        emit(TechHomeStates.success(
          tickets: tickets,
          selectedStatus: selectedStatus,
          selectedPriority: selectedPriority,
          dateFrom: from,
          dateTo: to,
        ));
      },
      orElse: () {},
    );
  }

  // ========== Computed Properties ==========
  int get pendingCount => state.maybeWhen(
        success: (tickets, _, selectedPriority, dateFrom, dateTo) {
          final filteredTickets = tickets.where((t) => t.status!.toLowerCase() == 'nouveau' );
          return filteredTickets.length;
        },
        orElse: () => 0,
      );

  int get activeCount => state.maybeWhen(
        success: (tickets, _, selectedPriority, dateFrom, dateTo) {
          final filteredTickets = tickets.where((t) => t.status!.toLowerCase() == 'en_cours');
          return filteredTickets.length;
        },
        orElse: () => 0,
      );

  int get doneCount => state.maybeWhen(
        success: (tickets, _, selectedPriority, dateFrom, dateTo) {
          final filteredTickets = tickets.where((t) => t.status!.toLowerCase() == 'ferme');
          return filteredTickets.length;
        },
        orElse: () => 0,
      );

  int get urgentCount => state.maybeWhen(
        success: (tickets, _, selectedPriority, dateFrom, dateTo) => tickets
            .where((t) =>
                t.priority!.toLowerCase() == 'haute' &&
                t.status!.toLowerCase() != 'ferme')
            .length,
        orElse: () => 0,
      );

  int get overdueCount => state.maybeWhen(
        success: (tickets, _, selectedPriority, dateFrom, dateTo) {
          final now = DateTime.now();
          return tickets.where((t) {
            if (t.status!.toLowerCase() == 'ferme') return false;

            final age = now.difference(DateTime.parse(t.dateCreation!));
            final priorite = t.priority!.toLowerCase();

            if (priorite == 'haute') return age.inHours > 24;
            if (priorite == 'moyenne') return age.inHours > 48;
            return age.inHours > 72;
          }).length;
        },
        orElse: () => 0,
      );

  List<TicketResponse> get filteredTickets => state.maybeWhen(
        success: (tickets, selectedStatus, priorityFilter, dateFrom, dateTo) {
          var result = tickets;

          // فلتر الحالة
          result = result
              .where((t) => _matchesStatus(t.status!, selectedStatus))
              .toList();

          // فلتر الأولوية
          if (priorityFilter == 'urgent') {
            result = result
                .where((t) => t.priority!.toLowerCase() == 'haute')
                .toList();
          }

          // فلتر التاريخ
          if (dateFrom != null && dateTo != null) {
            result = result.where((t) {
              return DateTime.parse(t.dateCreation!)
                      .isAfter(dateFrom.subtract(Duration(seconds: 1))) &&
                  DateTime.parse(t.dateCreation!).isBefore(dateTo.add(Duration(seconds: 1)));
            }).toList();
          }

          return result;
        },
        orElse: () => [],
      );

  bool _matchesStatus(String ticketStatus, String selectedStatus) {
    final status = ticketStatus.toLowerCase();
    switch (selectedStatus) {
      case 'pending':
        return status == 'ouvert';
      case 'active':
        return status == 'en_cours';
      case 'done':
        return status == 'ferme';
      default:
        return false;
    }
  }

  // ========== Actions ==========
  Future<void> startWorking(int ticketId) async {
    final result = await _repository.updateTicketStatus(ticketId, 'en_cours');

    result.when(
      success: (updatedTicket) {
        state.maybeWhen(
          success: (tickets, selectedStatus, priorityFilter, dateFrom, dateTo) {
            final updatedTickets = tickets.map((t) {
              return t.id == ticketId ? updatedTicket : t;
            }).toList();

            emit(TechHomeStates.success(
              tickets: updatedTickets,
              selectedStatus: selectedStatus,
              selectedPriority: priorityFilter,
              dateFrom: dateFrom,
              dateTo: dateTo,
            ));
          },
          orElse: () {},
        );
      },
      failure: (_) {},
    );
  }

  Future<void> resolveTicket(int ticketId) async {
    final result = await _repository.updateTicketStatus(ticketId, 'ferme');

    result.when(
      success: (updatedTicket) {
        state.maybeWhen(
          success: (tickets, selectedStatus, priorityFilter, dateFrom, dateTo) {
            final updatedTickets = tickets.map((t) {
              return t.id == ticketId ? updatedTicket : t;
            }).toList();

            emit(TechHomeStates.success(
              tickets: updatedTickets,
              selectedStatus: selectedStatus,
              selectedPriority: priorityFilter,
              dateFrom: dateFrom,
              dateTo: dateTo,
            ));
          },
          orElse: () {},
        );
      },
      failure: (_) {},
    );
  }
}