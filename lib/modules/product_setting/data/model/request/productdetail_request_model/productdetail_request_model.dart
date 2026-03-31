
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';

class ProductdetailRequestModel extends ProductdetailParam {
  const ProductdetailRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}