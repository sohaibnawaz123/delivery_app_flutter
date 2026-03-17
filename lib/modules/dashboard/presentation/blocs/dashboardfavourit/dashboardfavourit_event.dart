part of 'dashboardfavourit_bloc.dart';

sealed class DashboardfavouritEvent {}

class  LoadDashboardfavouritEvent extends DashboardfavouritEvent {
  final DashboardfavouritParam param;
   LoadDashboardfavouritEvent(this.param);
}
