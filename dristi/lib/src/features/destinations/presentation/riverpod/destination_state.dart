import 'package:equatable/equatable.dart';

enum DestinationStatus { initial, loading, success, failure }

class DestinationState<T> extends Equatable {
  const DestinationState({
    this.status = DestinationStatus.initial,
    this.data,
    this.errorMessage,
  });

  final DestinationStatus status;
  final T? data;
  final String? errorMessage;

  DestinationState copyWith({
    DestinationStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return DestinationState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
