import 'package:delivery_app/modules/dashboard/domain/entities/dashboardsetting_entity.dart';

class DashboardsettingModel {
  String? userMessage;
  bool? status;

  DashboardsettingModel({
    this.userMessage,
    this.status,
  });

  factory DashboardsettingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      DashboardsettingModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  DashboardsettingEntity toEntity() {
    return DashboardsettingEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
