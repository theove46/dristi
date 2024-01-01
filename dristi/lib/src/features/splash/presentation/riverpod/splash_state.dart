import 'package:equatable/equatable.dart';

enum SplashStatus { initial, loading, success, failure }

class SplashState<T> extends Equatable {
  const SplashState({
    this.status = SplashStatus.initial,
    this.data,
    this.errorMessage,
  });

  final SplashStatus status;
  final T? data;
  final String? errorMessage;

  SplashState copyWith({
    SplashStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return SplashState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
