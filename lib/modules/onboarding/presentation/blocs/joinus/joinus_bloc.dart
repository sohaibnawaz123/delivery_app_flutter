import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/entities/joinus_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';
import 'package:delivery_app/modules/onboarding/domain/usecase/joinus_use_case.dart';
import 'package:delivery_app/modules/onboarding/presentation/routes/joinus_view_initial_params.dart';

part 'joinus_event.dart';
part 'joinus_state.dart';

class JoinusBloc extends Bloc<JoinusEvent, JoinusState> {
  final JoinusViewInitialParams initialParams;
  final JoinusUseCase _useCase;

  JoinusBloc(this.initialParams, this._useCase)
      : super(JoinusState(initialParams: initialParams)) {
    on<LoadJoinusEvent>(_loadJoinusAction);
  }

  Future<void> _loadJoinusAction(
      LoadJoinusEvent event, Emitter<JoinusState> emit) async {
    emit(state.copyWith(joinusResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(joinusResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(joinusResponse: ApiResponse.completed(r)));
      },
    ));
  }
}