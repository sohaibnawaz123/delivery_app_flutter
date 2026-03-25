import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/product_setting/data/datasource/fetch_all_product_remote_data_source.dart';
import 'package:delivery_app/modules/product_setting/data/model/response/fetch_all_product_model/fetch_all_product_model.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';

class FetchAllProductRemoteDataSourceImpl
    implements FetchAllProductRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  FetchAllProductRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<FetchAllProductModel>>> 
      fetch_all_product(FetchAllProductParam data) =>
      network
          .get(
            AppUrl.fetchAllProductUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<FetchAllProductModel>.fromJson(
                      response,
                      (res) =>
                          FetchAllProductModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
