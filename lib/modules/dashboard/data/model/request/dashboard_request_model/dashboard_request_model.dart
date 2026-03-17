
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';

class DashboardRequestModel extends DashboardParam {
  const DashboardRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}