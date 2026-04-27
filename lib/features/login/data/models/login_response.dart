import 'package:help_desktops/features/admin/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponseBody {
  User? user;
  String? access;
  String? refresh;

  LoginResponseBody({this.user, this.access, this.refresh});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) => _$LoginResponseBodyFromJson(json);
}