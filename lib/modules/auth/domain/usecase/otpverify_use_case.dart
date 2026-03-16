import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/auth/domain/entities/otpverify_entity.dart';
import 'package:delivery_app/modules/auth/domain/failures/otpverify_failure.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';
import 'package:delivery_app/modules/auth/domain/repository/otpverify_repo.dart';

class OtpverifyUseCase {
  final OtpverifyRepo _repo;

  OtpverifyUseCase(this._repo);

  Future<
      Either<
          OtpverifyFailure,
          BaseEntity<OtpverifyEntity>>> execute(
    OtpverifyParam data,
  ) async {
    return await _repo.otpverify(data).then(
          (value) => value.fold(
            (err) => left(
              OtpverifyFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
