import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/accountsetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class AccountsettingRepo {
  Future<Either<RepoFailure, BaseEntity<AccountsettingEntity>>> 
      accountsetting(
    AccountsettingParam param,
  );
}
