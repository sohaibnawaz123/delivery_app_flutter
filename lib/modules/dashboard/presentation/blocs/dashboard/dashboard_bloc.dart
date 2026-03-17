import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboard_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboard_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboard_view_initial_params.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardViewInitialParams initialParams;
  final DashboardUseCase _useCase;

  DashboardBloc(this.initialParams, this._useCase)
      : super(DashboardState(initialParams: initialParams)) {
    on<LoadDashboardEvent>(_loadDashboardAction);
    on<OnDashboardTabChangedEvent>(_onDashboardTabChangedAction);
  }

  Future<void> _loadDashboardAction(
      LoadDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(dashboardResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(dashboardResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(dashboardResponse: ApiResponse.completed(r)));
      },
    ));
  }

  Future<void> _onDashboardTabChangedAction(
    OnDashboardTabChangedEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
