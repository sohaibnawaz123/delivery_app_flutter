import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/accountsetting_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/accountsetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/accountsetting_repo.dart';

class AccountsettingRestApiRepo implements AccountsettingRepo {
  final AccountsettingRemoteDataSource _dataSource;

  AccountsettingRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<AccountsettingEntity>>> 
      accountsetting(
    AccountsettingParam param,
  ) =>
      _dataSource.accountsetting(param).then(
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
