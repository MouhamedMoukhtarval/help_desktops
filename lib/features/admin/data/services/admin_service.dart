import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/base_endpoint.dart';
import 'package:help_desktops/features/admin/data/models/ticket_assignment_response.dart';
import 'package:help_desktops/features/admin/data/models/tikets_response.dart';
import 'package:help_desktops/features/admin/data/models/user.dart';
import 'package:help_desktops/features/admin/data/services/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'admin_service.g.dart';

@RestApi(baseUrl: BaseEndpoint.baseUrl)
abstract class AdminService {
  factory AdminService(Dio dio) = _AdminService;
  @GET(ApiConstants.usersList)
  Future<List<User>> getUsersList();
  @GET(ApiConstants.ticketsList)
  Future<TiketsResponse> getTicketsList();
  @POST(ApiConstants.assignTicket)
  Future<TicketAssignmentResponse> assignTicket(@Path('ticketId') int ticketId, @Body() Map<String, dynamic> body);
  

  
}