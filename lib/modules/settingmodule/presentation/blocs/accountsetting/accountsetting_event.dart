part of 'accountsetting_bloc.dart';

sealed class AccountsettingEvent {}

class  LoadAccountsettingEvent extends AccountsettingEvent {
  final AccountsettingParam param;
   LoadAccountsettingEvent(this.param);
}
