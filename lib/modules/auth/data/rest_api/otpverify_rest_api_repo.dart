import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/auth/data/datasource/otpverify_remote_data_source.dart';
import 'package:delivery_app/modules/auth/domain/entities/otpverify_entity.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';
import 'package:delivery_app/modules/auth/domain/repository/otpverify_repo.dart';

class OtpverifyRestApiRepo implements OtpverifyRepo {
  final OtpverifyRemoteDataSource _dataSource;

  OtpverifyRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<OtpverifyEntity>>> 
      otpverify(
    OtpverifyParam param,
  ) =>
      _dataSource.otpverify(param).then(
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
