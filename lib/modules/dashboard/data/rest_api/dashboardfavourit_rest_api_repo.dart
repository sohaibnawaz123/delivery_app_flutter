import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardfavourit_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardfavourit_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardfavourit_repo.dart';

class DashboardfavouritRestApiRepo implements DashboardfavouritRepo {
  final DashboardfavouritRemoteDataSource _dataSource;

  DashboardfavouritRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<DashboardfavouritEntity>>> 
      dashboardfavourit(
    DashboardfavouritParam param,
  ) =>
      _dataSource.dashboardfavourit(param).then(
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
