import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardhome_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardhome_model/dashboardhome_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardhome_param.dart';

class DashboardhomeRemoteDataSourceImpl
    implements DashboardhomeRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  DashboardhomeRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<DashboardhomeModel>>> 
      dashboardhome(DashboardhomeParam data) =>
      network
          .get(
            AppUrl.dashboardhomeUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<DashboardhomeModel>.fromJson(
                      response,
                      (res) =>
                          DashboardhomeModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
