import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardfavourit_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/failures/dashboardfavourit_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardfavourit_repo.dart';

class DashboardfavouritUseCase {
  final DashboardfavouritRepo _repo;

  DashboardfavouritUseCase(this._repo);

  Future<
      Either<
          DashboardfavouritFailure,
          BaseEntity<DashboardfavouritEntity>>> execute(
    DashboardfavouritParam data,
  ) async {
    return await _repo.dashboardfavourit(data).then(
          (value) => value.fold(
            (err) => left(
              DashboardfavouritFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
