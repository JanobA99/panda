import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../application/services/network_service.dart';

@Injectable(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  final Connectivity _connectivity = Connectivity();
  
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
  
  @override
  Future<void> checkConnectivity() async {
    await _connectivity.checkConnectivity();
  }
} 