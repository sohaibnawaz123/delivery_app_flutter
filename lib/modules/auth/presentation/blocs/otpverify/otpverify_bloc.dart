import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/auth/domain/entities/otpverify_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';
import 'package:delivery_app/modules/auth/domain/usecase/otpverify_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/routes/otpverify_view_initial_params.dart';

part 'otpverify_event.dart';
part 'otpverify_state.dart';

class OtpverifyBloc extends Bloc<OtpverifyEvent, OtpverifyState> {
  final OtpverifyViewInitialParams initialParams;
  final OtpverifyUseCase _useCase;

  OtpverifyBloc(this.initialParams, this._useCase)
      : super(OtpverifyState(initialParams: initialParams)) {
    on<LoadOtpverifyEvent>(_loadOtpverifyAction);
  }

  Future<void> _loadOtpverifyAction(
      LoadOtpverifyEvent event, Emitter<OtpverifyState> emit) async {
    emit(state.copyWith(otpverifyResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(otpverifyResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(otpverifyResponse: ApiResponse.completed(r)));
      },
    ));
  }
}