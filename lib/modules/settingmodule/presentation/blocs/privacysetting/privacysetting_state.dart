part of 'privacysetting_bloc.dart';

class PrivacysettingState extends Equatable {
  final PrivacysettingViewInitialParams initialParams;
  final ApiResponse<BaseEntity<PrivacysettingEntity>> privacysettingResponse;

  const PrivacysettingState({
    required this.initialParams,
    this.privacysettingResponse = const ApiResponse.init(),
  });

   PrivacysettingState copyWith({
    PrivacysettingViewInitialParams? initialParams,
    ApiResponse<BaseEntity<PrivacysettingEntity>>? privacysettingResponse,
  }) {
    PrivacysettingState data =   PrivacysettingState(
      initialParams: initialParams ?? this.initialParams,
      privacysettingResponse: privacysettingResponse ?? this.privacysettingResponse,
    );
    Utils.logInfo(data.toString(), name: "Privacysetting");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, privacysettingResponse];

  @override
  String toString() {
    return 'PrivacysettingState(initialParams: $initialParams, privacysettingResponse: ${privacysettingResponse.toString()})';
  }
}
