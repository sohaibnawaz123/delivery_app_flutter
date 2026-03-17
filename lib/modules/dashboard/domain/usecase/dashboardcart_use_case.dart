import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardcart_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/failures/dashboardcart_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardcart_repo.dart';

class DashboardcartUseCase {
  final DashboardcartRepo _repo;

  DashboardcartUseCase(this._repo);

  Future<
      Either<
          DashboardcartFailure,
          BaseEntity<DashboardcartEntity>>> execute(
    DashboardcartParam data,
  ) async {
    return await _repo.dashboardcart(data).then(
          (value) => value.fold(
            (err) => left(
              DashboardcartFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
