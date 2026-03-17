import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboard_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/failures/dashboard_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboard_repo.dart';

class DashboardUseCase {
  final DashboardRepo _repo;

  DashboardUseCase(this._repo);

  Future<
      Either<
          DashboardFailure,
          BaseEntity<DashboardEntity>>> execute(
    DashboardParam data,
  ) async {
    return await _repo.dashboard(data).then(
          (value) => value.fold(
            (err) => left(
              DashboardFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
