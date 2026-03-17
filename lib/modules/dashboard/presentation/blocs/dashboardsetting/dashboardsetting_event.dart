part of 'dashboardsetting_bloc.dart';

sealed class DashboardsettingEvent {}

class  LoadDashboardsettingEvent extends DashboardsettingEvent {
  final DashboardsettingParam param;
   LoadDashboardsettingEvent(this.param);
}
