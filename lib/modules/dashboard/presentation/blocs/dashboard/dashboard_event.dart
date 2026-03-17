part of 'dashboard_bloc.dart';

sealed class DashboardEvent {}

class  LoadDashboardEvent extends DashboardEvent {
  final DashboardParam param;
   LoadDashboardEvent(this.param);
}

class OnDashboardTabChangedEvent extends DashboardEvent {
  final int index;
  OnDashboardTabChangedEvent(this.index);
}
