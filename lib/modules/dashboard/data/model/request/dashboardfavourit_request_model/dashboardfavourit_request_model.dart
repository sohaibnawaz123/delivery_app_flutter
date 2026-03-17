
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';

class DashboardfavouritRequestModel extends DashboardfavouritParam {
  const DashboardfavouritRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}