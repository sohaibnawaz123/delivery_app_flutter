import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/privacysetting_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/failures/privacysetting_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/privacysetting_repo.dart';

class PrivacysettingUseCase {
  final PrivacysettingRepo _repo;

  PrivacysettingUseCase(this._repo);

  Future<
      Either<
          PrivacysettingFailure,
          BaseEntity<PrivacysettingEntity>>> execute(
    PrivacysettingParam data,
  ) async {
    return await _repo.privacysetting(data).then(
          (value) => value.fold(
            (err) => left(
              PrivacysettingFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
