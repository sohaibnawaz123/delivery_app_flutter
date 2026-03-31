import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/data/datasource/productdetail_remote_data_source.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/productdetail_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';
import 'package:delivery_app/modules/product_setting/domain/repository/productdetail_repo.dart';

class ProductdetailRestApiRepo implements ProductdetailRepo {
  final ProductdetailRemoteDataSource _dataSource;

  ProductdetailRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<ProductdetailEntity>>> 
      productdetail(
    ProductdetailParam param,
  ) =>
      _dataSource.productdetail(param).then(
        (value) => value.fold(
          (l) => left(RepoFailure(error: l.error)),
          (response) {
            try {
              return right(
                response.toDomain(
                  (val) => val!.toEntity(),
                ),
              );
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          },
        ),
      );
}
