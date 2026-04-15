import 'package:delivery_app/modules/settingmodule/domain/entities/myorders_entity.dart';

class MyordersModel {
  String? userMessage;
  bool? status;

  MyordersModel({
    this.userMessage,
    this.status,
  });

  factory MyordersModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      MyordersModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  MyordersEntity toEntity() {
    return MyordersEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
