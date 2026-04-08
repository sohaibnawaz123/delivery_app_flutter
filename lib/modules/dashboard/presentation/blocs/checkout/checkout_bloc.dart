import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/checkout_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/checkout_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/checkout_view_initial_params.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutViewInitialParams initialParams;
  final CheckoutUseCase _useCase;

  CheckoutBloc(this.initialParams, this._useCase)
      : super(CheckoutState(initialParams: initialParams)) {
    on<LoadCheckoutEvent>(_loadCheckoutAction);
  }

  Future<void> _loadCheckoutAction(
      LoadCheckoutEvent event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(checkoutResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(checkoutResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(checkoutResponse: ApiResponse.completed(r)));
      },
    ));
  }
}