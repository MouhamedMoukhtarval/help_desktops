import 'package:help_desktops/features/admin/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponseBody {
  User? user;
  String? access;
  String? refresh;
  SignUpResponseBody({this.user, this.access, this.refresh});

  factory SignUpResponseBody.fromJson(Map<String, dynamic> json) => _$SignUpResponseBodyFromJson(json);
}