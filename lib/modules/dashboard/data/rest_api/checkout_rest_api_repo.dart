import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/checkout_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/checkout_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/checkout_repo.dart';

class CheckoutRestApiRepo implements CheckoutRepo {
  final CheckoutRemoteDataSource _dataSource;

  CheckoutRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<CheckoutEntity>>> 
      checkout(
    CheckoutParam param,
  ) =>
      _dataSource.checkout(param).then(
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
