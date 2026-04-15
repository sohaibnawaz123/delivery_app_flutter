
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';

class MyordersRequestModel extends MyordersParam {
  const MyordersRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}