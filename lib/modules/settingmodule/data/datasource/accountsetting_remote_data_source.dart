import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/settingmodule/data/model/response/accountsetting_model/accountsetting_model.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/accountsetting_param.dart';
abstract class AccountsettingRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<AccountsettingModel>>> accountsetting(AccountsettingParam data);

}

