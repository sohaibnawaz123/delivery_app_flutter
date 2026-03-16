part of 'otpverify_bloc.dart';

class OtpverifyState extends Equatable {
  final OtpverifyViewInitialParams initialParams;
  final ApiResponse<BaseEntity<OtpverifyEntity>> otpverifyResponse;

  const OtpverifyState({
    required this.initialParams,
    this.otpverifyResponse = const ApiResponse.init(),
  });

   OtpverifyState copyWith({
    OtpverifyViewInitialParams? initialParams,
    ApiResponse<BaseEntity<OtpverifyEntity>>? otpverifyResponse,
  }) {
    OtpverifyState data =   OtpverifyState(
      initialParams: initialParams ?? this.initialParams,
      otpverifyResponse: otpverifyResponse ?? this.otpverifyResponse,
    );
    Utils.logInfo(data.toString(), name: "Otpverify");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, otpverifyResponse];

  @override
  String toString() {
    return 'OtpverifyState(initialParams: $initialParams, otpverifyResponse: ${otpverifyResponse.toString()})';
  }
}
