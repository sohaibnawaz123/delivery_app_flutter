import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/auth/data/datasource/resetpassword_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/model/response/resetpassword_model/resetpassword_model.dart';
import 'package:delivery_app/modules/auth/domain/params/resetpassword_param.dart';

class ResetpasswordRemoteDataSourceImpl
    implements ResetpasswordRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  ResetpasswordRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ResetpasswordModel>>> 
      resetpassword(ResetpasswordParam data) =>
      network
          .get(
            AppUrl.resetpasswordUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<ResetpasswordModel>.fromJson(
                      response,
                      (res) =>
                          ResetpasswordModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
