abstract class ILoginRepository {
  Future<void> googleAuth();
  bool userIsAuthenticated();
  String getCurrentUId();
}
