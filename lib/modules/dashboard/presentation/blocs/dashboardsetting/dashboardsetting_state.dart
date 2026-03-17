part of 'dashboardsetting_bloc.dart';

class DashboardsettingState extends Equatable {
  final DashboardsettingViewInitialParams initialParams;
  final ApiResponse<BaseEntity<DashboardsettingEntity>> dashboardsettingResponse;

  const DashboardsettingState({
    required this.initialParams,
    this.dashboardsettingResponse = const ApiResponse.init(),
  });

   DashboardsettingState copyWith({
    DashboardsettingViewInitialParams? initialParams,
    ApiResponse<BaseEntity<DashboardsettingEntity>>? dashboardsettingResponse,
  }) {
    DashboardsettingState data =   DashboardsettingState(
      initialParams: initialParams ?? this.initialParams,
      dashboardsettingResponse: dashboardsettingResponse ?? this.dashboardsettingResponse,
    );
    Utils.logInfo(data.toString(), name: "Dashboardsetting");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, dashboardsettingResponse];

  @override
  String toString() {
    return 'DashboardsettingState(initialParams: $initialParams, dashboardsettingResponse: ${dashboardsettingResponse.toString()})';
  }
}
