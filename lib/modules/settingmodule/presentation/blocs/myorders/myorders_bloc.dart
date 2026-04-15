import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/myorders_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/usecase/myorders_use_case.dart';
import 'package:delivery_app/modules/settingmodule/presentation/routes/myorders_view_initial_params.dart';

part 'myorders_event.dart';
part 'myorders_state.dart';

class MyordersBloc extends Bloc<MyordersEvent, MyordersState> {
  final MyordersViewInitialParams initialParams;
  final MyordersUseCase _useCase;

  MyordersBloc(this.initialParams, this._useCase)
      : super(MyordersState(initialParams: initialParams)) {
    on<LoadMyordersEvent>(_loadMyordersAction);
  }

  Future<void> _loadMyordersAction(
      LoadMyordersEvent event, Emitter<MyordersState> emit) async {
    emit(state.copyWith(myordersResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(myordersResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(myordersResponse: ApiResponse.completed(r)));
      },
    ));
  }
}