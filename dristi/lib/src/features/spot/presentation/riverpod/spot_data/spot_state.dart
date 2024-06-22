import 'package:equatable/equatable.dart';

enum SpotStatus { initial, loading, success, failure }

class SpotState<T> extends Equatable {
  const SpotState({
    this.status = SpotStatus.initial,
    this.data,
    this.errorMessage,
  });

  final SpotStatus status;
  final T? data;
  final String? errorMessage;

  SpotState copyWith({
    SpotStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return SpotState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
