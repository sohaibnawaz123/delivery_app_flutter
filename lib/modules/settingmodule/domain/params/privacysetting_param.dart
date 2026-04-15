import 'package:delivery_app/modules/settingmodule/data/model/request/privacysetting_request_model/privacysetting_request_model.dart';

class PrivacysettingParam {
  final String token;
  final String email;

  const PrivacysettingParam({
    required this.token,
    required this.email,
  });

  PrivacysettingRequestModel toModel() => PrivacysettingRequestModel(
        token: token,
        email: email,
      );
}