import 'package:fpdart/fpdart.dart';
import 'package:recipe_app_withai/core/errors/failure.dart';

abstract interface class UseCase<SuccessType,Params>{
  Future<Either<Failure,SuccessType>> call(Params params);
}

class NoParams{

}