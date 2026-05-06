import 'package:delivery_app/modules/auth/data/model/request/signup_request_model/signup_request_model.dart';

class SignupParam {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String fcmToken;
  final String deviceToken;
  final String? role;
  final String? city;

  const SignupParam({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.deviceToken,
    required this.fcmToken,
    required this.email,
    this.role,
    this.city,
  });

  SignupRequestModel toModel() => SignupRequestModel(
    deviceToken: deviceToken,
    email: email,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    password: password,
    confirmPassword: confirmPassword,
    fcmToken: fcmToken,
    role: role,
    city: city,
  );
}
