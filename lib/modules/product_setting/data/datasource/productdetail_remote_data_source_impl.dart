import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/product_setting/data/datasource/productdetail_remote_data_source.dart';
import 'package:delivery_app/modules/product_setting/data/model/response/productdetail_model/productdetail_model.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';

class ProductdetailRemoteDataSourceImpl
    implements ProductdetailRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  ProductdetailRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ProductdetailModel>>> 
      productdetail(ProductdetailParam data) =>
      network
          .get(
            AppUrl.productdetailUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<ProductdetailModel>.fromJson(
                      response,
                      (res) =>
                          ProductdetailModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
