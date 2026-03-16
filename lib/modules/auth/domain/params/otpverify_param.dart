import 'package:delivery_app/modules/auth/data/model/request/otpverify_request_model/otpverify_request_model.dart';

class OtpverifyParam {
  final String token;
  final String email;

  const OtpverifyParam({
    required this.token,
    required this.email,
  });

  OtpverifyRequestModel toModel() => OtpverifyRequestModel(
        token: token,
        email: email,
      );
}