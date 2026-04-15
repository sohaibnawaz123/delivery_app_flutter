import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/accountsetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/usecase/accountsetting_use_case.dart';
import 'package:delivery_app/modules/settingmodule/presentation/routes/accountsetting_view_initial_params.dart';

part 'accountsetting_event.dart';
part 'accountsetting_state.dart';

class AccountsettingBloc extends Bloc<AccountsettingEvent, AccountsettingState> {
  final AccountsettingViewInitialParams initialParams;
  final AccountsettingUseCase _useCase;

  AccountsettingBloc(this.initialParams, this._useCase)
      : super(AccountsettingState(initialParams: initialParams)) {
    on<LoadAccountsettingEvent>(_loadAccountsettingAction);
  }

  Future<void> _loadAccountsettingAction(
      LoadAccountsettingEvent event, Emitter<AccountsettingState> emit) async {
    emit(state.copyWith(accountsettingResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(accountsettingResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(accountsettingResponse: ApiResponse.completed(r)));
      },
    ));
  }
}