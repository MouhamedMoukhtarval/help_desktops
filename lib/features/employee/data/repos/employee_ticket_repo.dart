import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/employee/data/api/api_employee_service.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';

class EmployeeTicketRepo {
  final ApiEmployeeService _apiEmployeeService;
  EmployeeTicketRepo(this._apiEmployeeService);

  Future<ApiResult<List<TicketEmployeeResponse>>> getEmployeeTickets() async {
    try{
      final ticket = await _apiEmployeeService.getEmployeeTickets();
      return ApiResult.success(ticket);
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
  Future<ApiResult<Map<String, dynamic>>> creerTicket(String titre, String description, String? priority) async {
    try{
      final response = await _apiEmployeeService.creerTicket({
        'titre': titre,
        'description': description,
        'priorite': priority
      });
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<TicketDetails>> getTicketDetails(int ticketId) async {
    try{
      final response = await _apiEmployeeService.getTicketDetails(ticketId);
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}