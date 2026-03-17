import 'package:delivery_app/modules/dashboard/domain/entities/dashboardcart_entity.dart';

class DashboardcartModel {
  String? userMessage;
  bool? status;

  DashboardcartModel({
    this.userMessage,
    this.status,
  });

  factory DashboardcartModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      DashboardcartModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  DashboardcartEntity toEntity() {
    return DashboardcartEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
