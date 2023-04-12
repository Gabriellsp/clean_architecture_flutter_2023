abstract class ILoginRepository {
  Future<void> googleAuth();
  Future<void> signOut();
  bool userIsAuthenticated();
  String getCurrentUId();
}
