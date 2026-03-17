part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final DashboardViewInitialParams initialParams;
  final ApiResponse<BaseEntity<DashboardEntity>> dashboardResponse;
  final int currentIndex;

  const DashboardState({
    required this.initialParams,
    this.dashboardResponse = const ApiResponse.init(),
    this.currentIndex = 0,
  });

   DashboardState copyWith({
    DashboardViewInitialParams? initialParams,
    ApiResponse<BaseEntity<DashboardEntity>>? dashboardResponse,
    int? currentIndex,
  }) {
    DashboardState data =   DashboardState(
      initialParams: initialParams ?? this.initialParams,
      dashboardResponse: dashboardResponse ?? this.dashboardResponse,
      currentIndex: currentIndex ?? this.currentIndex,
    );
    Utils.logInfo(data.toString(), name: "Dashboard");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, dashboardResponse, currentIndex];

  @override
  String toString() {
    return 'DashboardState(initialParams: $initialParams, currentIndex: $currentIndex, dashboardResponse: ${dashboardResponse.toString()})';
  }
}
