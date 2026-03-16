import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/entities/joinus_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/failures/joinus_failure.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';
import 'package:delivery_app/modules/onboarding/domain/repository/joinus_repo.dart';

class JoinusUseCase {
  final JoinusRepo _repo;

  JoinusUseCase(this._repo);

  Future<
      Either<
          JoinusFailure,
          BaseEntity<JoinusEntity>>> execute(
    JoinusParam data,
  ) async {
    return await _repo.joinus(data).then(
          (value) => value.fold(
            (err) => left(
              JoinusFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
