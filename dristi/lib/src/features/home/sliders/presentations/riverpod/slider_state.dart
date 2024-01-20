import 'package:equatable/equatable.dart';

enum SliderStatus { initial, loading, success, failure }

class SliderState<T> extends Equatable {
  const SliderState({
    this.status = SliderStatus.initial,
    this.data,
    this.errorMessage,
  });

  final SliderStatus status;
  final T? data;
  final String? errorMessage;

  SliderState copyWith({
    SliderStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return SliderState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
