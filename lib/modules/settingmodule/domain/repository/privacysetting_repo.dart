import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/privacysetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class PrivacysettingRepo {
  Future<Either<RepoFailure, BaseEntity<PrivacysettingEntity>>> 
      privacysetting(
    PrivacysettingParam param,
  );
}
