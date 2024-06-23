import 'package:equatable/equatable.dart';

enum HotelsListStatus { initial, loading, success, failure }

class HotelsListState<T> extends Equatable {
  const HotelsListState({
    this.status = HotelsListStatus.initial,
    this.data,
    this.errorMessage,
  });

  final HotelsListStatus status;
  final T? data;
  final String? errorMessage;

  HotelsListState copyWith({
    HotelsListStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return HotelsListState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
