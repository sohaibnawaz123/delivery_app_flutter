import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/accountsetting_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/accountsetting_model/accountsetting_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';

class AccountsettingRemoteDataSourceImpl
    implements AccountsettingRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  AccountsettingRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<AccountsettingModel>>> 
      accountsetting(AccountsettingParam data) =>
      network
          .get(
            AppUrl.accountsettingUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<AccountsettingModel>.fromJson(
                      response,
                      (res) =>
                          AccountsettingModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
