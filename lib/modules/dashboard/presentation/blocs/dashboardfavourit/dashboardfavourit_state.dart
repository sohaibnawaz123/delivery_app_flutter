part of 'dashboardfavourit_bloc.dart';

class DashboardfavouritState extends Equatable {
  final DashboardfavouritViewInitialParams initialParams;
  final ApiResponse<BaseEntity<DashboardfavouritEntity>> dashboardfavouritResponse;

  const DashboardfavouritState({
    required this.initialParams,
    this.dashboardfavouritResponse = const ApiResponse.init(),
  });

   DashboardfavouritState copyWith({
    DashboardfavouritViewInitialParams? initialParams,
    ApiResponse<BaseEntity<DashboardfavouritEntity>>? dashboardfavouritResponse,
  }) {
    DashboardfavouritState data =   DashboardfavouritState(
      initialParams: initialParams ?? this.initialParams,
      dashboardfavouritResponse: dashboardfavouritResponse ?? this.dashboardfavouritResponse,
    );
    Utils.logInfo(data.toString(), name: "Dashboardfavourit");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, dashboardfavouritResponse];

  @override
  String toString() {
    return 'DashboardfavouritState(initialParams: $initialParams, dashboardfavouritResponse: ${dashboardfavouritResponse.toString()})';
  }
}
