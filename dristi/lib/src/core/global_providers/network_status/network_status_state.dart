import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

enum NetworkStatus { initial, loading, success, failure }

class NetworkState extends Equatable {
  const NetworkState({
    this.status = NetworkStatus.initial,
    this.errorMessage,
    this.value,
  });

  final NetworkStatus status;
  final String? errorMessage;
  final List<ConnectivityResult>? value;

  NetworkState copyWith({
    NetworkStatus? status,
    String? errorMessage,
    List<ConnectivityResult>? value,
  }) {
    return NetworkState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      value: value ?? [ConnectivityResult.none],
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        value,
      ];
}
