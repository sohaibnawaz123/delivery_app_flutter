import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/signup_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class SignupRepo {
  Future<Either<RepoFailure, BaseEntity<SignupEntity>>> 
      signup(
    SignupParam param,
  );
}
