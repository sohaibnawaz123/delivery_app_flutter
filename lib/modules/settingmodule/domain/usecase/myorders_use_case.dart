import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/myorders_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/failures/myorders_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';
import 'package:delivery_app/modules/settingmodule/domain/repository/myorders_repo.dart';

class MyordersUseCase {
  final MyordersRepo _repo;

  MyordersUseCase(this._repo);

  Future<
      Either<
          MyordersFailure,
          BaseEntity<MyordersEntity>>> execute(
    MyordersParam data,
  ) async {
    return await _repo.myorders(data).then(
          (value) => value.fold(
            (err) => left(
              MyordersFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
