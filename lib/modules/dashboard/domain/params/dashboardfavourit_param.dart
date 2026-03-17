import 'package:delivery_app/modules/dashboard/data/model/request/dashboardfavourit_request_model/dashboardfavourit_request_model.dart';

class DashboardfavouritParam {
  final String token;
  final String email;

  const DashboardfavouritParam({
    required this.token,
    required this.email,
  });

  DashboardfavouritRequestModel toModel() => DashboardfavouritRequestModel(
        token: token,
        email: email,
      );
}