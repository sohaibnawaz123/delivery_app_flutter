part of 'dashboardcart_bloc.dart';

class DashboardcartState extends Equatable {
  final DashboardcartViewInitialParams initialParams;
  final ApiResponse<BaseEntity<DashboardcartEntity>> dashboardcartResponse;

  const DashboardcartState({
    required this.initialParams,
    this.dashboardcartResponse = const ApiResponse.init(),
  });

   DashboardcartState copyWith({
    DashboardcartViewInitialParams? initialParams,
    ApiResponse<BaseEntity<DashboardcartEntity>>? dashboardcartResponse,
  }) {
    DashboardcartState data =   DashboardcartState(
      initialParams: initialParams ?? this.initialParams,
      dashboardcartResponse: dashboardcartResponse ?? this.dashboardcartResponse,
    );
    Utils.logInfo(data.toString(), name: "Dashboardcart");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, dashboardcartResponse];

  @override
  String toString() {
    return 'DashboardcartState(initialParams: $initialParams, dashboardcartResponse: ${dashboardcartResponse.toString()})';
  }
}
