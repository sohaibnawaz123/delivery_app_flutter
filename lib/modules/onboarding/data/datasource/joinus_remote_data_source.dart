import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/onboarding/data/model/response/joinus_model/joinus_model.dart';
import 'package:delivery_app/modules/onboarding/domain/params/joinus_param.dart';
abstract class JoinusRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<JoinusModel>>> joinus(JoinusParam data);

}

