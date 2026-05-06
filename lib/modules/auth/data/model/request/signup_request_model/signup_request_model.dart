import 'package:delivery_app/modules/auth/domain/params/signup_param.dart';

class SignupRequestModel extends SignupParam {
  const SignupRequestModel({
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.password,
    required super.confirmPassword,
    required super.fcmToken,
    required super.deviceToken,
    required super.email,
    super.role,
    super.city,
  });

  Map<String, dynamic> toJson() => {
    'token': deviceToken,
    'email': email,
    'fcm_token': fcmToken,
    'first_name': firstName,
    'last_name': lastName,
    'phone_number': phoneNumber,
    'password': password,
    'confirm_password': confirmPassword,
    if (role != null) 'role': role,
    if (city != null) 'city': city,
  };
}
