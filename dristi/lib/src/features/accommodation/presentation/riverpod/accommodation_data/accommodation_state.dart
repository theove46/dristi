import 'package:equatable/equatable.dart';

enum AccommodationStatus { initial, loading, success, failure }

class AccommodationState<T> extends Equatable {
  const AccommodationState({
    this.status = AccommodationStatus.initial,
    this.data,
    this.errorMessage,
  });

  final AccommodationStatus status;
  final T? data;
  final String? errorMessage;

  AccommodationState copyWith({
    AccommodationStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return AccommodationState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
