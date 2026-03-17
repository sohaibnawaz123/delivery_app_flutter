import 'package:delivery_app/modules/dashboard/data/model/request/dashboard_request_model/dashboard_request_model.dart';

class DashboardParam {
  final String token;
  final String email;

  const DashboardParam({
    required this.token,
    required this.email,
  });

  DashboardRequestModel toModel() => DashboardRequestModel(
        token: token,
        email: email,
      );
}