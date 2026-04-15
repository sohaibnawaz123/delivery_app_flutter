import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/myorders_model/myorders_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';
abstract class MyordersRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<MyordersModel>>> myorders(MyordersParam data);

}

