import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardsetting_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/failures/dashboardsetting_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardsetting_repo.dart';

class DashboardsettingUseCase {
  final DashboardsettingRepo _repo;

  DashboardsettingUseCase(this._repo);

  Future<
      Either<
          DashboardsettingFailure,
          BaseEntity<DashboardsettingEntity>>> execute(
    DashboardsettingParam data,
  ) async {
    return await _repo.dashboardsetting(data).then(
          (value) => value.fold(
            (err) => left(
              DashboardsettingFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
