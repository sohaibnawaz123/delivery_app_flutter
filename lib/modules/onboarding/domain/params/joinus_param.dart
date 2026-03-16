import 'package:delivery_app/modules/onboarding/data/model/request/joinus_request_model/joinus_request_model.dart';

class JoinusParam {
  final String token;
  final String email;

  const JoinusParam({
    required this.token,
    required this.email,
  });

  JoinusRequestModel toModel() => JoinusRequestModel(
        token: token,
        email: email,
      );
}