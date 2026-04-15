import 'package:delivery_app/modules/settingmodule/data/model/request/accountsetting_request_model/accountsetting_request_model.dart';

class AccountsettingParam {
  final String token;
  final String email;

  const AccountsettingParam({
    required this.token,
    required this.email,
  });

  AccountsettingRequestModel toModel() => AccountsettingRequestModel(
        token: token,
        email: email,
      );
}