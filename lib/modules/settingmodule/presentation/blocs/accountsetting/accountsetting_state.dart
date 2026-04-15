part of 'accountsetting_bloc.dart';

class AccountsettingState extends Equatable {
  final AccountsettingViewInitialParams initialParams;
  final ApiResponse<BaseEntity<AccountsettingEntity>> accountsettingResponse;

  const AccountsettingState({
    required this.initialParams,
    this.accountsettingResponse = const ApiResponse.init(),
  });

   AccountsettingState copyWith({
    AccountsettingViewInitialParams? initialParams,
    ApiResponse<BaseEntity<AccountsettingEntity>>? accountsettingResponse,
  }) {
    AccountsettingState data =   AccountsettingState(
      initialParams: initialParams ?? this.initialParams,
      accountsettingResponse: accountsettingResponse ?? this.accountsettingResponse,
    );
    Utils.logInfo(data.toString(), name: "Accountsetting");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, accountsettingResponse];

  @override
  String toString() {
    return 'AccountsettingState(initialParams: $initialParams, accountsettingResponse: ${accountsettingResponse.toString()})';
  }
}
