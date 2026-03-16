import 'package:delivery_app/modules/onboarding/domain/entities/joinus_entity.dart';

class JoinusModel {
  String? userMessage;
  bool? status;

  JoinusModel({
    this.userMessage,
    this.status,
  });

  factory JoinusModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      JoinusModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  JoinusEntity toEntity() {
    return JoinusEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
