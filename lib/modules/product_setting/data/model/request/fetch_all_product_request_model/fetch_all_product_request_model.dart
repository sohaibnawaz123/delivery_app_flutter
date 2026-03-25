
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';

class FetchAllProductRequestModel extends FetchAllProductParam {
  const FetchAllProductRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}