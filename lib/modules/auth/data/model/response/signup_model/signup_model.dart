import 'package:delivery_app/modules/auth/data/model/response/signup_model/user-model.dart';
import 'package:delivery_app/modules/auth/domain/entities/signup_entity.dart';

class SignupModel {
  final UserModel? user;
  final String? otp;

  SignupModel({this.user, this.otp});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      otp: json['otp']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'otp': otp};
  // ✅ copyWith
  SignupModel copyWith({UserModel? user, String? otp}) {
    return SignupModel(user: user ?? this.user, otp: otp ?? this.otp);
  }

  SignupEntity toEntity() {
    return SignupEntity(user: user?.toEntity(), otp: otp ?? '');
  }
}


