import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:help_desktops/core/networking/dio_factory.dart';
import 'package:help_desktops/features/technician/data/repos/ticket_repo.dart';
import 'package:help_desktops/features/technician/data/services/technician_service.dart';
import 'package:help_desktops/features/technician/logic/tech_home_cubit.dart';

final getit = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  // Home screen technician 
  getit.registerLazySingleton<TicketService>(()=> TicketService(dio));
  getit.registerLazySingleton<TicketRepo>(()=> TicketRepo(getit()));
  getit.registerFactory<TechnicianHomeCubit>(()=> TechnicianHomeCubit(getit()));

}