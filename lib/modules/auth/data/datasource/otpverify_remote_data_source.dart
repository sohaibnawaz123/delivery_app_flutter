import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/auth/data/model/response/otpverify_model/otpverify_model.dart';
import 'package:delivery_app/modules/auth/domain/params/otpverify_param.dart';
abstract class OtpverifyRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<OtpverifyModel>>> otpverify(OtpverifyParam data);

}

