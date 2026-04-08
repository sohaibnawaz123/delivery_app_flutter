
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';

class CheckoutRequestModel extends CheckoutParam {
  const CheckoutRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}