import 'package:delivery_app/modules/product_setting/data/model/request/fetch_all_product_request_model/fetch_all_product_request_model.dart';

class FetchAllProductParam {
  final String token;
  final String email;

  const FetchAllProductParam({
    required this.token,
    required this.email,
  });

  FetchAllProductRequestModel toModel() => FetchAllProductRequestModel(
        token: token,
        email: email,
      );
}