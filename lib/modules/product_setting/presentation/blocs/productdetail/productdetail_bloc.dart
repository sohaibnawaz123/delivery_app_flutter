import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_app/core/network/api_response.dart';
import 'package:delivery_app/core/utils/utils.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/productdetail_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';
import 'package:delivery_app/modules/product_setting/domain/usecase/productdetail_use_case.dart';
import 'package:delivery_app/modules/product_setting/presentation/routes/productdetail_view_initial_params.dart';

part 'productdetail_event.dart';
part 'productdetail_state.dart';

class ProductdetailBloc extends Bloc<ProductdetailEvent, ProductdetailState> {
  final ProductdetailViewInitialParams initialParams;
  final ProductdetailUseCase _useCase;

  ProductdetailBloc(this.initialParams, this._useCase)
      : super(ProductdetailState(initialParams: initialParams)) {
    on<LoadProductdetailEvent>(_loadProductdetailAction);
  }

  Future<void> _loadProductdetailAction(
      LoadProductdetailEvent event, Emitter<ProductdetailState> emit) async {
    emit(state.copyWith(productdetailResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(productdetailResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(productdetailResponse: ApiResponse.completed(r)));
      },
    ));
  }
}