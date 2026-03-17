import 'package:delivery_app/modules/dashboard/domain/entities/dashboard_entity.dart';

class DashboardModel {
  String? userMessage;
  bool? status;

  DashboardModel({
    this.userMessage,
    this.status,
  });

  factory DashboardModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      DashboardModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  DashboardEntity toEntity() {
    return DashboardEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
