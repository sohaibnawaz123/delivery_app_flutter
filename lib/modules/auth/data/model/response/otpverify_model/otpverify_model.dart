import 'package:delivery_app/modules/auth/domain/entities/otpverify_entity.dart';

class OtpverifyModel {
  String? userMessage;
  bool? status;

  OtpverifyModel({
    this.userMessage,
    this.status,
  });

  factory OtpverifyModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      OtpverifyModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  OtpverifyEntity toEntity() {
    return OtpverifyEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
