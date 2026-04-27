import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:help_desktops/core/networking/dio_factory.dart';
import 'package:help_desktops/features/admin/data/repos/admin_repo.dart';
import 'package:help_desktops/features/admin/data/services/admin_service.dart';
import 'package:help_desktops/features/login/data/repos/login_repo.dart';
import 'package:help_desktops/features/login/data/services/api_services.dart';
import 'package:help_desktops/features/login/logic/cubit/login_cubit.dart';
import 'package:help_desktops/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_cubit.dart';
import 'package:help_desktops/features/technician/data/repos/ticket_repo.dart';
import 'package:help_desktops/features/technician/data/services/technician_service.dart';
import 'package:help_desktops/features/technician/logic/tech_home_cubit.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/data/repos/ticket_resolve_repos.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/data/service/resolve_ticket_service.dart';
import 'package:help_desktops/features/technician/ticket-resolve-feature/logic/resolve_ticket_cubit.dart';

final getit = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  // Home screen technician
  getit.registerLazySingleton<TicketService>(() => TicketService(dio));
  getit.registerLazySingleton<TicketRepo>(() => TicketRepo(getit()));
  getit.registerFactory<TechnicianHomeCubit>(
    () => TechnicianHomeCubit(getit()),
  );

  // Resolve ticket
  getit.registerLazySingleton<ResolveTicketService>(
    () => ResolveTicketService(dio),
  );
  getit.registerFactory<ResolveTicketCubit>(() => ResolveTicketCubit(getit(), getit()));
  getit.registerLazySingleton<TicketResolveRepos>(
    () => TicketResolveRepos(getit()),
  );

  // Admin
  getit.registerLazySingleton<AdminService>(() => AdminService(dio));
  getit.registerLazySingleton<AdminRepo>(() => AdminRepo(getit()));

  // Login
  getit.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  // Sign up
  getit.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getit()));
  getit.registerFactory<SignUpCubit>(() => SignUpCubit(getit()));

}
