import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/privacysetting_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/privacysetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/privacysetting_repo.dart';

class PrivacysettingRestApiRepo implements PrivacysettingRepo {
  final PrivacysettingRemoteDataSource _dataSource;

  PrivacysettingRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<PrivacysettingEntity>>> 
      privacysetting(
    PrivacysettingParam param,
  ) =>
      _dataSource.privacysetting(param).then(
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
