import 'package:delivery_app/modules/dashboard/data/model/request/checkout_request_model/checkout_request_model.dart';

class CheckoutParam {
  final String token;
  final String email;

  const CheckoutParam({
    required this.token,
    required this.email,
  });

  CheckoutRequestModel toModel() => CheckoutRequestModel(
        token: token,
        email: email,
      );
}