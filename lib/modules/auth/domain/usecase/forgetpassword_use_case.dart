import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/auth/domain/entities/forgetpassword_entity.dart';
import 'package:delivery_app/modules/auth/domain/failures/forgetpassword_failure.dart';
import 'package:delivery_app/modules/auth/domain/params/forgetpassword_param.dart';
import 'package:delivery_app/modules/auth/domain/repository/forgetpassword_repo.dart';

class ForgetpasswordUseCase {
  final ForgetpasswordRepo _repo;

  ForgetpasswordUseCase(this._repo);

  Future<
      Either<
          ForgetpasswordFailure,
          BaseEntity<ForgetpasswordEntity>>> execute(
    ForgetpasswordParam data,
  ) async {
    return await _repo.forgetpassword(data).then(
          (value) => value.fold(
            (err) => left(
              ForgetpasswordFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
