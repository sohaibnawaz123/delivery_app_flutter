import 'package:delivery_app/modules/settingmodule/domain/entities/accountsetting_entity.dart';

class AccountsettingModel {
  String? userMessage;
  bool? status;

  AccountsettingModel({
    this.userMessage,
    this.status,
  });

  factory AccountsettingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AccountsettingModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  AccountsettingEntity toEntity() {
    return AccountsettingEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
