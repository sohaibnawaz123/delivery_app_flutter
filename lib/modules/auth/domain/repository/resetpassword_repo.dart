import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/auth/domain/entities/resetpassword_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/resetpassword_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class ResetpasswordRepo {
  Future<Either<RepoFailure, BaseEntity<ResetpasswordEntity>>> 
      resetpassword(
    ResetpasswordParam param,
  );
}
