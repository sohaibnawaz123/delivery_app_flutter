import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboard_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboard_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboard_repo.dart';

class DashboardRestApiRepo implements DashboardRepo {
  final DashboardRemoteDataSource _dataSource;

  DashboardRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<DashboardEntity>>> 
      dashboard(
    DashboardParam param,
  ) =>
      _dataSource.dashboard(param).then(
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
