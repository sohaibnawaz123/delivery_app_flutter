import 'package:delivery_app/modules/product_setting/domain/entities/productdetail_entity.dart';

class ProductdetailModel {
  String? userMessage;
  bool? status;

  ProductdetailModel({
    this.userMessage,
    this.status,
  });

  factory ProductdetailModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductdetailModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  ProductdetailEntity toEntity() {
    return ProductdetailEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
