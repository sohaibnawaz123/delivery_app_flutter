part of 'checkout_bloc.dart';

sealed class CheckoutEvent {}

class  LoadCheckoutEvent extends CheckoutEvent {
  final CheckoutParam param;
   LoadCheckoutEvent(this.param);
}
