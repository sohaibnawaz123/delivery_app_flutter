
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';

class DashboardsettingRequestModel extends DashboardsettingParam {
  const DashboardsettingRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}