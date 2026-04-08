import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/checkout_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/checkout_model/checkout_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';

class CheckoutRemoteDataSourceImpl
    implements CheckoutRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  CheckoutRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<CheckoutModel>>> 
      checkout(CheckoutParam data) =>
      network
          .get(
            AppUrl.checkoutUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<CheckoutModel>.fromJson(
                      response,
                      (res) =>
                          CheckoutModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
