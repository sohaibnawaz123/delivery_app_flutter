
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';

class JoinusRequestModel extends JoinusParam {
  const JoinusRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}