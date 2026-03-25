import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/product_setting/data/datasource/fetch_all_product_remote_data_source.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/fetch_all_product_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';
import 'package:delivery_app/modules/product_setting/domain/repository/fetch_all_product_repo.dart';

class FetchAllProductRestApiRepo implements FetchAllProductRepo {
  final FetchAllProductRemoteDataSource _dataSource;

  FetchAllProductRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<FetchAllProductEntity>>> 
      fetchAllProduct(
    FetchAllProductParam param,
  ) =>
      _dataSource.fetch_all_product(param).then(
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
