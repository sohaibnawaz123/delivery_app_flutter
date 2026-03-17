import 'package:delivery_app/modules/dashboard/data/model/request/dashboardsetting_request_model/dashboardsetting_request_model.dart';

class DashboardsettingParam {
  final String token;
  final String email;

  const DashboardsettingParam({
    required this.token,
    required this.email,
  });

  DashboardsettingRequestModel toModel() => DashboardsettingRequestModel(
        token: token,
        email: email,
      );
}