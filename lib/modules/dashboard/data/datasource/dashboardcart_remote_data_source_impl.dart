import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardcart_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardcart_model/dashboardcart_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';

class DashboardcartRemoteDataSourceImpl
    implements DashboardcartRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  DashboardcartRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<DashboardcartModel>>> 
      dashboardcart(DashboardcartParam data) =>
      network
          .get(
            AppUrl.dashboardcartUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<DashboardcartModel>.fromJson(
                      response,
                      (res) =>
                          DashboardcartModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
