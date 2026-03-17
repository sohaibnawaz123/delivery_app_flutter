import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardfavourit_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardfavourit_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardfavourit_view_initial_params.dart';

part 'dashboardfavourit_event.dart';
part 'dashboardfavourit_state.dart';

class DashboardfavouritBloc extends Bloc<DashboardfavouritEvent, DashboardfavouritState> {
  final DashboardfavouritViewInitialParams initialParams;
  final DashboardfavouritUseCase _useCase;

  DashboardfavouritBloc(this.initialParams, this._useCase)
      : super(DashboardfavouritState(initialParams: initialParams)) {
    on<LoadDashboardfavouritEvent>(_loadDashboardfavouritAction);
  }

  Future<void> _loadDashboardfavouritAction(
      LoadDashboardfavouritEvent event, Emitter<DashboardfavouritState> emit) async {
    emit(state.copyWith(dashboardfavouritResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(dashboardfavouritResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(dashboardfavouritResponse: ApiResponse.completed(r)));
      },
    ));
  }
}