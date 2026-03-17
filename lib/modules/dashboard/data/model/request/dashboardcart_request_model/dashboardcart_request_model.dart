
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';

class DashboardcartRequestModel extends DashboardcartParam {
  const DashboardcartRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}