import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/joinus_remote_data_source.dart';
import 'package:delivery_app/modules/onboarding/data/model/response/joinus_model/joinus_model.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';

class JoinusRemoteDataSourceImpl
    implements JoinusRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  JoinusRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<JoinusModel>>> 
      joinus(JoinusParam data) =>
      network
          .get(
            AppUrl.joinusUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<JoinusModel>.fromJson(
                      response,
                      (res) =>
                          JoinusModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
