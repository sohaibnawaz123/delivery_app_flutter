import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/auth/domain/entities/resetpassword_entity.dart';
import 'package:delivery_app/modules/auth/domain/failures/resetpassword_failure.dart';
import 'package:delivery_app/modules/auth/domain/params/resetpassword_param.dart';
import 'package:delivery_app/modules/auth/domain/repository/resetpassword_repo.dart';

class ResetpasswordUseCase {
  final ResetpasswordRepo _repo;

  ResetpasswordUseCase(this._repo);

  Future<
      Either<
          ResetpasswordFailure,
          BaseEntity<ResetpasswordEntity>>> execute(
    ResetpasswordParam data,
  ) async {
    return await _repo.resetpassword(data).then(
          (value) => value.fold(
            (err) => left(
              ResetpasswordFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
