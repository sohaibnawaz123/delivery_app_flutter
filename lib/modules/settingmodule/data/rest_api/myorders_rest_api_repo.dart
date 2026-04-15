import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/myorders_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/myorders_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/myorders_repo.dart';

class MyordersRestApiRepo implements MyordersRepo {
  final MyordersRemoteDataSource _dataSource;

  MyordersRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<MyordersEntity>>> 
      myorders(
    MyordersParam param,
  ) =>
      _dataSource.myorders(param).then(
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
