import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/accountsetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/failures/accountsetting_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/accountsetting_repo.dart';

class AccountsettingUseCase {
  final AccountsettingRepo _repo;

  AccountsettingUseCase(this._repo);

  Future<
      Either<
          AccountsettingFailure,
          BaseEntity<AccountsettingEntity>>> execute(
    AccountsettingParam data,
  ) async {
    return await _repo.accountsetting(data).then(
          (value) => value.fold(
            (err) => left(
              AccountsettingFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
