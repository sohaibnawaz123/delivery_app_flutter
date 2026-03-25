import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/fetch_all_product_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';
import 'package:delivery_app/modules/product_setting/domain/usecase/fetch_all_product_use_case.dart';
import 'package:delivery_app/modules/product_setting/presentation/routes/fetch_all_product_view_initial_params.dart';

part 'fetch_all_product_event.dart';
part 'fetch_all_product_state.dart';

class FetchAllProductBloc extends Bloc<FetchAllProductEvent, FetchAllProductState> {
  final FetchAllProductViewInitialParams initialParams;
  final FetchAllProductUseCase _useCase;

  FetchAllProductBloc(this.initialParams, this._useCase)
      : super(FetchAllProductState(initialParams: initialParams)) {
    on<LoadFetchAllProductEvent>(_loadFetchAllProductAction);
  }

  Future<void> _loadFetchAllProductAction(
      LoadFetchAllProductEvent event, Emitter<FetchAllProductState> emit) async {
    emit(state.copyWith(fetchAllProductResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(fetchAllProductResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(fetchAllProductResponse: ApiResponse.completed(r)));
      },
    ));
  }
}