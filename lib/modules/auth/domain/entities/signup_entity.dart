import 'package:delivery_app/modules/auth/domain/entities/signup-entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final UserEntity? user;
  final String otp;

  const SignupEntity({required this.user, required this.otp});

  SignupEntity copyWith({UserEntity? user, String? otp}) {
    return SignupEntity(user: user ?? this.user, otp: otp ?? this.otp);
  }
  factory SignupEntity.empty() {
    return SignupEntity(user: UserEntity.empty(), otp: '');
  }

  @override
  String toString() => 'SignupEntity(user: $user, otp: $otp)';

  @override
  List<Object?> get props => [user, otp];
}
