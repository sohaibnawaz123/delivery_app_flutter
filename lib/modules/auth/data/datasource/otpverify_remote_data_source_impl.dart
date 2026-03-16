import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/core/network/api_header.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/auth/data/datasource/otpverify_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/model/response/otpverify_model/otpverify_model.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';

class OtpverifyRemoteDataSourceImpl
    implements OtpverifyRemoteDataSource {
  final Network network;
  final AppUrl appUrl;

  OtpverifyRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<OtpverifyModel>>> 
      otpverify(OtpverifyParam data) =>
      network
          .get(
            AppUrl.otpverifyUrl,
            query: data.toModel().toJson(),
            ApiHeader.bearerHeaderWithApplicationJson(data.token),
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<OtpverifyModel>.fromJson(
                      response,
                      (res) =>
                          OtpverifyModel.fromJson(res['data']),
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
