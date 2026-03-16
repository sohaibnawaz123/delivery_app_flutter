import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/auth/domain/entities/forgetpassword_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/forgetpassword_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class ForgetpasswordRepo {
  Future<Either<RepoFailure, BaseEntity<ForgetpasswordEntity>>> 
      forgetpassword(
    ForgetpasswordParam param,
  );
}
