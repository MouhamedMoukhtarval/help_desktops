import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/admin/data/models/ticket_assignment_response.dart';
import 'package:help_desktops/features/admin/data/models/tikets_response.dart';
import 'package:help_desktops/features/admin/data/models/user.dart';
import 'package:help_desktops/features/admin/data/services/admin_service.dart';

class AdminRepo {
  final AdminService _adminService;

  AdminRepo(this._adminService);

  Future<ApiResult<List<User>>> getUsersList() async {
    try {
      final users = await _adminService.getUsersList();
      return ApiResult.success(users);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TiketsResponse>> getTicketsList() async {
    try {
      final tickets = await _adminService.getTicketsList();
      return ApiResult.success(tickets);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TicketAssignmentResponse>> assignTicket(int ticketId, int techId) async {
    try {
      final ticket = await _adminService.assignTicket(ticketId, {
        'assigne_a': techId,
      });
      return ApiResult.success(ticket);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
