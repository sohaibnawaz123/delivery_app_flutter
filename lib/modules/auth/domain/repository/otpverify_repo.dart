import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/auth/domain/entities/otpverify_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class OtpverifyRepo {
  Future<Either<RepoFailure, BaseEntity<OtpverifyEntity>>> 
      otpverify(
    OtpverifyParam param,
  );
}
