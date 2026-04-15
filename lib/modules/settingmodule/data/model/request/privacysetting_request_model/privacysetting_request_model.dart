
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';

class PrivacysettingRequestModel extends PrivacysettingParam {
  const PrivacysettingRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}