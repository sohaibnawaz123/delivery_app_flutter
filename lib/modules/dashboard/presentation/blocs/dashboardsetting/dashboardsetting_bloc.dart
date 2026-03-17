import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardsetting_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardsetting_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardsetting_view_initial_params.dart';

part 'dashboardsetting_event.dart';
part 'dashboardsetting_state.dart';

class DashboardsettingBloc extends Bloc<DashboardsettingEvent, DashboardsettingState> {
  final DashboardsettingViewInitialParams initialParams;
  final DashboardsettingUseCase _useCase;

  DashboardsettingBloc(this.initialParams, this._useCase)
      : super(DashboardsettingState(initialParams: initialParams)) {
    on<LoadDashboardsettingEvent>(_loadDashboardsettingAction);
  }

  Future<void> _loadDashboardsettingAction(
      LoadDashboardsettingEvent event, Emitter<DashboardsettingState> emit) async {
    emit(state.copyWith(dashboardsettingResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(dashboardsettingResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(dashboardsettingResponse: ApiResponse.completed(r)));
      },
    ));
  }
}