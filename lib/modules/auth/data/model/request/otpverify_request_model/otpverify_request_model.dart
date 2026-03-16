
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';

class OtpverifyRequestModel extends OtpverifyParam {
  const OtpverifyRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}