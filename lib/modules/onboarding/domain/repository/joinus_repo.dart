import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/onboarding/domain/entities/joinus_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';

abstract class JoinusRepo {
  Future<Either<RepoFailure, BaseEntity<JoinusEntity>>> 
      joinus(
    JoinusParam param,
  );
}
