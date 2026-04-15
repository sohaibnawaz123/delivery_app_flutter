import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/datasource/myorders_remote_data_source.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/myorders_model/myorders_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';

class MyordersRemoteDataSourceImpl
    implements MyordersRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  MyordersRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<MyordersModel>>> 
      myorders(MyordersParam data) =>
      network
          .get(
            AppUrl.myordersUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<MyordersModel>.fromJson(
                      response,
                      (res) =>
                          MyordersModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
