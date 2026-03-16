import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/auth/domain/entities/login_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/login_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class LoginRepo {
  Future<Either<RepoFailure, BaseEntity<LoginEntity>>> 
      login(
    LoginParam param,
  );
}
