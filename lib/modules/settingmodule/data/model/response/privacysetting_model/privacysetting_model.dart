import 'package:delivery_app/modules/settingmodule/domain/entities/privacysetting_entity.dart';

class PrivacysettingModel {
  String? userMessage;
  bool? status;

  PrivacysettingModel({
    this.userMessage,
    this.status,
  });

  factory PrivacysettingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      PrivacysettingModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  PrivacysettingEntity toEntity() {
    return PrivacysettingEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
