import 'package:delivery_app/modules/product_setting/data/model/request/productdetail_request_model/productdetail_request_model.dart';

class ProductdetailParam {
  final String token;
  final String email;

  const ProductdetailParam({
    required this.token,
    required this.email,
  });

  ProductdetailRequestModel toModel() => ProductdetailRequestModel(
        token: token,
        email: email,
      );
}