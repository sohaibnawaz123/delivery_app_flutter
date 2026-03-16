part of 'joinus_bloc.dart';

sealed class JoinusEvent {}

class  LoadJoinusEvent extends JoinusEvent {
  final JoinusParam param;
   LoadJoinusEvent(this.param);
}
