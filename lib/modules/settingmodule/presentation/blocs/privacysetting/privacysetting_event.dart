part of 'privacysetting_bloc.dart';

sealed class PrivacysettingEvent {}

class  LoadPrivacysettingEvent extends PrivacysettingEvent {
  final PrivacysettingParam param;
   LoadPrivacysettingEvent(this.param);
}
