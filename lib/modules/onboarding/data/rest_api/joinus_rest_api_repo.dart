import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/joinus_remote_data_source.dart';
import 'package:delivery_app/modules/onboarding/domain/entities/joinus_entity.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';
import 'package:delivery_app/modules/onboarding/domain/repository/joinus_repo.dart';

class JoinusRestApiRepo implements JoinusRepo {
  final JoinusRemoteDataSource _dataSource;

  JoinusRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<JoinusEntity>>> 
      joinus(
    JoinusParam param,
  ) =>
      _dataSource.joinus(param).then(
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
