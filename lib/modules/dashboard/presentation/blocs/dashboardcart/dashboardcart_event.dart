part of 'dashboardcart_bloc.dart';

sealed class DashboardcartEvent {}

class  LoadDashboardcartEvent extends DashboardcartEvent {
  final DashboardcartParam param;
   LoadDashboardcartEvent(this.param);
}
