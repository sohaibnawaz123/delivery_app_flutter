import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardcart_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardcart_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardcart_repo.dart';

class DashboardcartRestApiRepo implements DashboardcartRepo {
  final DashboardcartRemoteDataSource _dataSource;

  DashboardcartRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<DashboardcartEntity>>> 
      dashboardcart(
    DashboardcartParam param,
  ) =>
      _dataSource.dashboardcart(param).then(
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
