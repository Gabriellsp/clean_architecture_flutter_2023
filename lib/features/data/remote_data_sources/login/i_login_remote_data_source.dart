abstract class ILoginRemoteDataSource {
  Future<void> googleAuth();
  bool userIsAuthenticated();
  String getCurrentUId();
}
