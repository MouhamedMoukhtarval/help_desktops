import 'package:json_annotation/json_annotation.dart';
part 'sgin_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String username;
  final String email;
  final String password;
  @JsonKey(name: 'password2')
  final String confirmPassword;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String role;

  SignUpRequestBody({
    required this.confirmPassword,
    required this.username,
    required this.email,
    required this.password, required this.firstName, required this.lastName, required this.role,
    }
  );

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
