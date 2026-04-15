import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/privacysetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/usecase/privacysetting_use_case.dart';
import 'package:delivery_app/modules/settingmodule/presentation/routes/privacysetting_view_initial_params.dart';

part 'privacysetting_event.dart';
part 'privacysetting_state.dart';

class PrivacysettingBloc extends Bloc<PrivacysettingEvent, PrivacysettingState> {
  final PrivacysettingViewInitialParams initialParams;
  final PrivacysettingUseCase _useCase;

  PrivacysettingBloc(this.initialParams, this._useCase)
      : super(PrivacysettingState(initialParams: initialParams)) {
    on<LoadPrivacysettingEvent>(_loadPrivacysettingAction);
  }

  Future<void> _loadPrivacysettingAction(
      LoadPrivacysettingEvent event, Emitter<PrivacysettingState> emit) async {
    emit(state.copyWith(privacysettingResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(privacysettingResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(privacysettingResponse: ApiResponse.completed(r)));
      },
    ));
  }
}