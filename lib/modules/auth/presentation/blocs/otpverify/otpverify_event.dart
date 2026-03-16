part of 'otpverify_bloc.dart';

sealed class OtpverifyEvent {}

class  LoadOtpverifyEvent extends OtpverifyEvent {
  final OtpverifyParam param;
   LoadOtpverifyEvent(this.param);
}
