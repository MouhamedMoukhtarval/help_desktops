import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/data/service/resolve_ticket_service.dart';

class TicketResolveRepos {
  final ResolveTicketService _resolveTicketService;
  TicketResolveRepos(this._resolveTicketService);
  Future<ApiResult<Map<String, String>>> addComment(
      int ticketId, String commentData) async {
    try {
      final comment = await _resolveTicketService.addComment(ticketId, {"commentaire": commentData});
      return ApiResult.success(comment);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
      
    }
  }
}