import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboard_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboard_model/dashboard_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';

class DashboardRemoteDataSourceImpl
    implements DashboardRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  DashboardRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<DashboardModel>>> 
      dashboard(DashboardParam data) =>
      network
          .get(
            AppUrl.dashboardUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<DashboardModel>.fromJson(
                      response,
                      (res) =>
                          DashboardModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
