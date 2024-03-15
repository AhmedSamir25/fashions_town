import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetConnectionStatus { connected, disconnected }

class InternetCubit extends Cubit<InternetConnectionStatus> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivitySubscription;

  InternetCubit() : super(InternetConnectionStatus.disconnected) {
    _init();
  }

  void _init() async {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _updateConnectionStatus(await _connectivity.checkConnectivity());
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(InternetConnectionStatus.disconnected);
    } else {
      emit(InternetConnectionStatus.connected);
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
