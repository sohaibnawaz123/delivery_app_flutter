import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/auth/data/datasource/signup_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/model/response/signup_model/signup_model.dart';
import 'package:delivery_app/modules/auth/domain/params/signup_param.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  SignupRemoteDataSourceImpl(this.network, this.appUrl);

  @override
  Future<Either<RepoFailure, BaseJson<SignupModel>>> signup(SignupParam data) =>
      network
          .post(
            AppUrl.signupUrl,
            data.toModel().toJson(),
            ApiHeader.json(),
          )
          .then(
            (value) => value.fold((l) => left(RepoFailure(error: l.error)), (
              response,
            ) {
              try {
                return right(
                  BaseJson<SignupModel>.fromJson(
                    response,
                    SignupModel.fromJson,
                  ),
                );
              } catch (e) {
                return left(RepoFailure(error: e.toString()));
              }
            }),
          );
}
