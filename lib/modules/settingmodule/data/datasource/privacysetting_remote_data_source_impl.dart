import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/privacysetting_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/privacysetting_model/privacysetting_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';

class PrivacysettingRemoteDataSourceImpl
    implements PrivacysettingRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  PrivacysettingRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<PrivacysettingModel>>> 
      privacysetting(PrivacysettingParam data) =>
      network
          .get(
            AppUrl.privacysettingUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<PrivacysettingModel>.fromJson(
                      response,
                      (res) =>
                          PrivacysettingModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
