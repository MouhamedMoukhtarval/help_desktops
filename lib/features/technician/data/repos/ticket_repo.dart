import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
import 'package:help_desktops/features/technician/data/services/technician_service.dart';

class TicketRepo {
  final TicketService _ticketService;
  TicketRepo(this._ticketService);
  Future<ApiResult<List<TicketResponse>>> getTickets() async {
    try{
    final tickets = await _ticketService.getTechnicianDashboard();
    return ApiResult.success(tickets);

  } on DioException catch (e) {
    return ApiResult.failure(ApiErrorHandler.handle(e));
  }
  }
  Future<ApiResult<TicketResponse>> updateTicketStatus(int ticketId, String status) async {
    try{
    final ticket = await _ticketService.updateTicketStatus(ticketId, {'statut': status});
    return ApiResult.success(ticket);

  } on DioException catch (e) {
    return ApiResult.failure(ApiErrorHandler.handle(e));
  }
  }
}