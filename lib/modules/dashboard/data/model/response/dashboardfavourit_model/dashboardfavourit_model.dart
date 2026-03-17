import 'package:delivery_app/modules/dashboard/domain/entities/dashboardfavourit_entity.dart';

class DashboardfavouritModel {
  String? userMessage;
  bool? status;

  DashboardfavouritModel({
    this.userMessage,
    this.status,
  });

  factory DashboardfavouritModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      DashboardfavouritModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  DashboardfavouritEntity toEntity() {
    return DashboardfavouritEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
