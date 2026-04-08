part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final CheckoutViewInitialParams initialParams;
  final ApiResponse<BaseEntity<CheckoutEntity>> checkoutResponse;

  const CheckoutState({
    required this.initialParams,
    this.checkoutResponse = const ApiResponse.init(),
  });

   CheckoutState copyWith({
    CheckoutViewInitialParams? initialParams,
    ApiResponse<BaseEntity<CheckoutEntity>>? checkoutResponse,
  }) {
    CheckoutState data =   CheckoutState(
      initialParams: initialParams ?? this.initialParams,
      checkoutResponse: checkoutResponse ?? this.checkoutResponse,
    );
    Utils.logInfo(data.toString(), name: "Checkout");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, checkoutResponse];

  @override
  String toString() {
    return 'CheckoutState(initialParams: $initialParams, checkoutResponse: ${checkoutResponse.toString()})';
  }
}
