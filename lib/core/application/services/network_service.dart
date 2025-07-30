abstract class NetworkService {
  Future<bool> get isConnected;
  Future<void> checkConnectivity();
} 