import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardsetting_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardsetting_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardsetting_repo.dart';

class DashboardsettingRestApiRepo implements DashboardsettingRepo {
  final DashboardsettingRemoteDataSource _dataSource;

  DashboardsettingRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<DashboardsettingEntity>>> 
      dashboardsetting(
    DashboardsettingParam param,
  ) =>
      _dataSource.dashboardsetting(param).then(
        (value) => value.fold(
          (l) => left(RepoFailure(error: l.error)),
          (response) {
            try {
              return right(
                response.toDomain(
                  (val) => val!.toEntity(),
                ),
              );
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          },
        ),
      );
}
