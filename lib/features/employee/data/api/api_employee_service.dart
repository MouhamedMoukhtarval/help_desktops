import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/base_endpoint.dart';
import 'package:help_desktops/features/employee/data/api/api_employee_constants.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_employee_service.g.dart';

@RestApi(baseUrl: BaseEndpoint.baseUrl)
abstract class ApiEmployeeService {
  factory ApiEmployeeService(Dio dio) = _ApiEmployeeService;

  @GET(ApiEmployeeConstants.employeeTicketsEndpoint)
  Future<List<TicketEmployeeResponse>> getEmployeeTickets();

  @POST(ApiEmployeeConstants.employeeCreerTicket)
  Future<Map<String, String?>> creerTicket(
    @Body() Map<String, String?> ticketDetails
  );

  @GET(ApiEmployeeConstants.getTicketDetails)
  Future<TicketDetails> getTicketDetails(
    @Path('ticketId') int ticketId
  );


}