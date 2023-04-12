abstract class ILoginRemoteDataSource {
  Future<void> googleAuth();
  Future<void> signOut();
  bool userIsAuthenticated();
  String getCurrentUId();
}
