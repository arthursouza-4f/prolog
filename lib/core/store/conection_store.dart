import 'package:mobx/mobx.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'conection_store.g.dart';

class ConectionStore = _ConectionStore with _$ConectionStore;

abstract class _ConectionStore with Store {
  ObservableStream<ConnectivityResult> connectivityStream = ObservableStream(
    Connectivity().onConnectivityChanged,
  );

  @computed
  bool get isConnected => connectivityStream.value != ConnectivityResult.none;
}
