import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/privacysetting_model/privacysetting_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/privacysetting_param.dart';
abstract class PrivacysettingRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<PrivacysettingModel>>> privacysetting(PrivacysettingParam data);

}

