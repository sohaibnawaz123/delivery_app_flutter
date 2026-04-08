import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/checkout_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class CheckoutRepo {
  Future<Either<RepoFailure, BaseEntity<CheckoutEntity>>> 
      checkout(
    CheckoutParam param,
  );
}
