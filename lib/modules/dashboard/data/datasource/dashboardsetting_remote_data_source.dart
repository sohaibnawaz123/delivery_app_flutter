import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardsetting_model/dashboardsetting_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';
abstract class DashboardsettingRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<DashboardsettingModel>>> dashboardsetting(DashboardsettingParam data);

}

