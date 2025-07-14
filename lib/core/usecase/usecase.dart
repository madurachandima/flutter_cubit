abstract class UseCase<Type, Params, Page> {
  Future<Type> call({Params params, Page page});
}
