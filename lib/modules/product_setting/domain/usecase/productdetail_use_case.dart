import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/productdetail_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/failures/productdetail_failure.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';
import 'package:delivery_app/modules/product_setting/domain/repository/productdetail_repo.dart';

class ProductdetailUseCase {
  final ProductdetailRepo _repo;

  ProductdetailUseCase(this._repo);

  Future<
      Either<
          ProductdetailFailure,
          BaseEntity<ProductdetailEntity>>> execute(
    ProductdetailParam data,
  ) async {
    return await _repo.productdetail(data).then(
          (value) => value.fold(
            (err) => left(
              ProductdetailFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
