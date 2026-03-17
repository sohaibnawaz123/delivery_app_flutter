import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardfavourit_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardfavourit_model/dashboardfavourit_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';

class DashboardfavouritRemoteDataSourceImpl
    implements DashboardfavouritRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  DashboardfavouritRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<DashboardfavouritModel>>> 
      dashboardfavourit(DashboardfavouritParam data) =>
      network
          .get(
            AppUrl.dashboardfavouritUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<DashboardfavouritModel>.fromJson(
                      response,
                      (res) =>
                          DashboardfavouritModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
