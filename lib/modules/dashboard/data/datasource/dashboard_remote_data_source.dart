import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboard_model/dashboard_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';
abstract class DashboardRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<DashboardModel>>> dashboard(DashboardParam data);

}

