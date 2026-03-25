import 'package:delivery_app/modules/product_setting/domain/entities/fetch_all_product_entity.dart';

class FetchAllProductModel {
  String? userMessage;
  bool? status;

  FetchAllProductModel({
    this.userMessage,
    this.status,
  });

  factory FetchAllProductModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      FetchAllProductModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  FetchAllProductEntity toEntity() {
    return FetchAllProductEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
