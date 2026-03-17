import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardcart_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardcart_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardcart_view_initial_params.dart';

part 'dashboardcart_event.dart';
part 'dashboardcart_state.dart';

class DashboardcartBloc extends Bloc<DashboardcartEvent, DashboardcartState> {
  final DashboardcartViewInitialParams initialParams;
  final DashboardcartUseCase _useCase;

  DashboardcartBloc(this.initialParams, this._useCase)
      : super(DashboardcartState(initialParams: initialParams)) {
    on<LoadDashboardcartEvent>(_loadDashboardcartAction);
  }

  Future<void> _loadDashboardcartAction(
      LoadDashboardcartEvent event, Emitter<DashboardcartState> emit) async {
    emit(state.copyWith(dashboardcartResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(dashboardcartResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(dashboardcartResponse: ApiResponse.completed(r)));
      },
    ));
  }
}