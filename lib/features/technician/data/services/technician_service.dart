import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/base_endpoint.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
import 'package:help_desktops/features/technician/data/services/endpoints_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'technician_service.g.dart';

@RestApi(baseUrl: BaseEndpoint.baseUrl)
abstract class TicketService {
  factory TicketService(Dio dio) = _TicketService;

  @GET(EndpointsConstant.technicianDashboard)
  Future<List<TicketResponse>> getTechnicianDashboard();

  @POST(EndpointsConstant.updateTicketStatus)
  Future<TicketResponse> updateTicketStatus(
    @Path('id') int ticketId,
    @Body() Map<String, String> statusUpdate,
  );
}
