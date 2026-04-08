import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/checkout_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/failures/checkout_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/checkout_repo.dart';

class CheckoutUseCase {
  final CheckoutRepo _repo;

  CheckoutUseCase(this._repo);

  Future<
      Either<
          CheckoutFailure,
          BaseEntity<CheckoutEntity>>> execute(
    CheckoutParam data,
  ) async {
    return await _repo.checkout(data).then(
          (value) => value.fold(
            (err) => left(
              CheckoutFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
