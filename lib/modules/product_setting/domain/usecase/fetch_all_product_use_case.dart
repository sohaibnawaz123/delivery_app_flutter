import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/fetch_all_product_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/failures/fetch_all_product_failure.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';
import 'package:delivery_app/modules/product_setting/domain/repository/fetch_all_product_repo.dart';

class FetchAllProductUseCase {
  final FetchAllProductRepo _repo;

  FetchAllProductUseCase(this._repo);

  Future<
      Either<
          FetchAllProductFailure,
          BaseEntity<FetchAllProductEntity>>> execute(
    FetchAllProductParam data,
  ) async {
    return await _repo.fetchAllProduct(data).then(
          (value) => value.fold(
            (err) => left(
              FetchAllProductFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
