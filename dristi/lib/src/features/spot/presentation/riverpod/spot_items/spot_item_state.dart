import 'package:equatable/equatable.dart';

enum SpotItemsStatus { initial, loading, success, failure }

class SpotItemsState<T> extends Equatable {
  const SpotItemsState({
    this.status = SpotItemsStatus.initial,
    this.data,
    this.errorMessage,
  });

  final SpotItemsStatus status;
  final T? data;
  final String? errorMessage;

  SpotItemsState copyWith({
    SpotItemsStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return SpotItemsState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
