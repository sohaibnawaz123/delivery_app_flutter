import 'package:delivery_app/modules/dashboard/data/model/request/dashboardcart_request_model/dashboardcart_request_model.dart';

class DashboardcartParam {
  final String token;
  final String email;

  const DashboardcartParam({
    required this.token,
    required this.email,
  });

  DashboardcartRequestModel toModel() => DashboardcartRequestModel(
        token: token,
        email: email,
      );
}