import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/auth/data/datasource/forgetpassword_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/model/response/forgetpassword_model/forgetpassword_model.dart';
import 'package:delivery_app/modules/auth/domain/params/forgetpassword_param.dart';

class ForgetpasswordRemoteDataSourceImpl
    implements ForgetpasswordRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  ForgetpasswordRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ForgetpasswordModel>>> 
      forgetpassword(ForgetpasswordParam data) =>
      network
          .get(
            AppUrl.forgetpasswordUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<ForgetpasswordModel>.fromJson(
                      response,
                      (res) =>
                          ForgetpasswordModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
