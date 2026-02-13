import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';
import 'package:help_desktops/features/employee/data/repos/employee_ticket_repo.dart';
import 'package:help_desktops/features/employee/logic/employee_home_states.dart';


class EmployeeHomeCubit extends Cubit<EmployeeHomeStates> {
  final EmployeeTicketRepo _repository;

  EmployeeHomeCubit(this._repository)
    : super(const EmployeeHomeStates.initial()) {
    loadTickets();
  }

  // ========== Load Tickets ==========
  Future<void> loadTickets() async {
    emit(const EmployeeHomeStates.loading());

    final result = await _repository.getEmployeeTickets();

    result.when(
      success: (tickets) {
        final now = DateTime.now();
        final startOfDay = DateTime(now.year, now.month, now.day);
        final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

        emit(
          EmployeeHomeStates.success(
            tickets: tickets,
            selectedStatus: 'active',
            selectedPriority: 'all',
            dateFrom: startOfDay,
            dateTo: endOfDay,
          ),
        );
      },
      failure: (message) {
        emit(EmployeeHomeStates.error(message));
      },
    );
  }

  // ========== Refresh ==========
  Future<void> refresh() async {
    final result = await _repository.getEmployeeTickets();

    result.when(
      success: (tickets) {
        state.maybeWhen(
          success:
              (tickets, ticketsDeatils, selectedStatus, selectedPriority, dateFrom, dateTo) {
                emit(
                  EmployeeHomeStates.success(
                    tickets: tickets ,
                    tiketDetails:  ticketsDeatils,
                    selectedStatus: selectedStatus,
                    selectedPriority: selectedPriority,
                    dateFrom: dateFrom,
                    dateTo: dateTo,
                  ),
                );
              },
          orElse: () {},
        );
      },
      failure: (message) {
        emit(EmployeeHomeStates.error(message));
      },
    );
  }

  // ========== Filters ==========
  void selectStatus(String status) {
    state.maybeWhen(
      success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) {
        emit(
          EmployeeHomeStates.success(
            tickets: tickets,
            tiketDetails: ticketsDetails,
            selectedStatus: status,
            selectedPriority: selectedPriority,
            dateFrom: dateFrom,
            dateTo: dateTo,
          ),
        );
      },
      orElse: () {},
    );
  }

  void setPriorityFilter(String filter) {
    state.maybeWhen(
      success: (tickets, ticketsDetails, selectedStatus, _, dateFrom, dateTo) {
        emit(
          EmployeeHomeStates.success(
            tickets: tickets,
            tiketDetails: ticketsDetails,
            selectedStatus: selectedStatus,
            selectedPriority: filter,
            dateFrom: dateFrom,
            dateTo: dateTo,
          ),
        );
      },
      orElse: () {},
    );
  }

  void setDateFilter(DateTime? from, DateTime? to) {
    state.maybeWhen(
      success: (tickets, ticketDetails, selectedStatus, selectedPriority, _, _) {
        emit(
          EmployeeHomeStates.success(
            tickets: tickets,
            tiketDetails: ticketDetails,
            selectedStatus: selectedStatus,
            selectedPriority: selectedPriority,
            dateFrom: from,
            dateTo: to,
          ),
        );
      },
      orElse: () {},
    );
  }

  // ========== Computed Properties ==========
  int get pendingCount => state.maybeWhen(
    success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) {
      final filteredTickets = tickets!.where(
        (t) => t!.status?.toLowerCase() == 'nouveau',
      );
      return filteredTickets.length;
    },
    orElse: () => 0,
  );

  int get activeCount => state.maybeWhen(
    success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) {
      final filteredTickets = tickets!.where(
        (t) => t!.status?.toLowerCase() == 'en_cours',
      );
      return filteredTickets.length;
    },
    orElse: () => 0,
  );

  int get doneCount => state.maybeWhen(
    success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) {
      final filteredTickets = tickets!.where(
        (t) => t!.status?.toLowerCase() == 'ferme',
      );
      return filteredTickets.length;
    },
    orElse: () => 0,
  );

  int get urgentCount => state.maybeWhen(
    success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) => tickets!

        .where(
          (t) =>
              t!.priority?.toLowerCase() == 'haute' &&
              t.status?.toLowerCase() != 'ferme',
        )
        .length,
    orElse: () => 0,
  );

  int get overdueCount => state.maybeWhen(
    success: (tickets, ticketsDetails, _, selectedPriority, dateFrom, dateTo) {
      final now = DateTime.now();
      return tickets!.where((t) {
        if (t!.status?.toLowerCase() == 'ferme') return false;
        final age = now.difference(DateTime.parse(t.dateCreation!));
        final priorite = t.priority?.toLowerCase();

        if (priorite == 'haute') return age.inHours > 24;
        if (priorite == 'moyenne') return age.inHours > 48;
        return age.inHours > 72;
      }).length;
    },
    orElse: () => 0,
  );

  List<TicketEmployeeResponse?>? get filteredTickets => state.maybeWhen(
    success: (tickets, ticketDetails, selectedStatus, priorityFilter, dateFrom, dateTo) {
      var result = tickets;

      // فلتر الحالة
      result = result
          ?.where((t) => _matchesStatus(t!.status!, selectedStatus))
          .toList();

      // فلتر الأولوية
      if (priorityFilter == 'urgent') {
        result = result
            ?.where((t) => t?.priority?.toLowerCase() == 'haute')
            .toList();
      }

      // فلتر التاريخ
      if (dateFrom != null && dateTo != null) {
        result = result?.where((t) {
          return DateTime.parse(
                t!.dateCreation!,
              ).isAfter(dateFrom.subtract(Duration(seconds: 1))) &&
              DateTime.parse(
                t.dateCreation!,
              ).isBefore(dateTo.add(Duration(seconds: 1)));
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
        return status == 'nouveau';
      case 'active':
        return status == 'en_cours';
      case 'done':
        return status == 'ferme';
      default:
        return false;
    }
  }

  // ========== Actions ==========
  Future<void> getDetails(int ticketId) async {
    final result = await _repository.getTicketDetails(ticketId);

    result.when(
      success: (updatedTicket) {
        state.maybeWhen(
          success:
              (
                tickets,
                techHomeStates,
                selectedStatus,
                priorityFilter,
                dateFrom,
                dateTo,
              ) {
                emit(
                  EmployeeHomeStates.success(
                    tickets: tickets,
                    tiketDetails: techHomeStates,
                    selectedStatus: selectedStatus,
                    selectedPriority: priorityFilter,
                    dateFrom: dateFrom,
                    dateTo: dateTo,
                  ),
                );
              },
          orElse: () {},
        );
      },
      failure: (_) {},
    );
  }

  Future<void> resolveTicket(String titre, String description, String priority) async {
    final result = await _repository.creerTicket(titre, description, priority);

    result.when(
      success: (updatedTicket) {
        state.maybeWhen(
          success:
              (
                ticketsSWR,
                ticketDetails,
                selectedStatus,
                priorityFilter,
                dateFrom,
                dateTo,
              ) {
                emit(
                  EmployeeHomeStates.success(
                    tickets: ticketsSWR,
                    tiketDetails: ticketDetails,
                    selectedStatus: selectedStatus,
                    selectedPriority: priorityFilter,
                    dateFrom: dateFrom,
                    dateTo: dateTo,
                  ),
                );
              },
          orElse: () {},
        );
      },
      failure: (_) {},
    );
  }
  void clearTicketDetails(){
    state.maybeWhen(
      success: (ticket,_,selectStatus,priorityFilter, dateFrom, dateTo){
        emit(EmployeeHomeStates.success(
          tickets: ticket,
          tiketDetails: null,
          selectedPriority: selectStatus,
          selectedStatus: selectStatus,
          dateFrom: dateFrom,
          dateTo: dateTo
        ));
      },
      orElse: () {},
    );
  }
}
