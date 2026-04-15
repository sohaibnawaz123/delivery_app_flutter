
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';

class AccountsettingRequestModel extends AccountsettingParam {
  const AccountsettingRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}