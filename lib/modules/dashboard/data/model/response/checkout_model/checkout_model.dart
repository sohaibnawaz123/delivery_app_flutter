import 'package:delivery_app/modules/dashboard/domain/entities/checkout_entity.dart';

class CheckoutModel {
  String? userMessage;
  bool? status;

  CheckoutModel({
    this.userMessage,
    this.status,
  });

  factory CheckoutModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CheckoutModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  CheckoutEntity toEntity() {
    return CheckoutEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
