import 'package:delivery_app/modules/settingmodule/data/model/request/myorders_request_model/myorders_request_model.dart';

class MyordersParam {
  final String token;
  final String email;

  const MyordersParam({
    required this.token,
    required this.email,
  });

  MyordersRequestModel toModel() => MyordersRequestModel(
        token: token,
        email: email,
      );
}