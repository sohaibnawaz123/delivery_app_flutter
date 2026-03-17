import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardsetting_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardsetting_model/dashboardsetting_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';

class DashboardsettingRemoteDataSourceImpl
    implements DashboardsettingRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  DashboardsettingRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<DashboardsettingModel>>> 
      dashboardsetting(DashboardsettingParam data) =>
      network
          .get(
            AppUrl.dashboardsettingUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<DashboardsettingModel>.fromJson(
                      response,
                      (res) =>
                          DashboardsettingModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
