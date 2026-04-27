import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/base_endpoint.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/data/service/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'resolve_ticket_service.g.dart';

@RestApi(baseUrl: BaseEndpoint.baseUrl)
abstract class ResolveTicketService {
  factory ResolveTicketService(Dio dio) = _ResolveTicketService;

  @POST(ApiConstants.addCommentEndpoint)
  Future<Map<String, String>> addComment(
    @Path("ticketId") int ticketId,
    @Body() Map<String, dynamic> commentData,
  );

}