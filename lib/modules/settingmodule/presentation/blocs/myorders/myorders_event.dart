part of 'myorders_bloc.dart';

sealed class MyordersEvent {}

class  LoadMyordersEvent extends MyordersEvent {
  final MyordersParam param;
   LoadMyordersEvent(this.param);
}
