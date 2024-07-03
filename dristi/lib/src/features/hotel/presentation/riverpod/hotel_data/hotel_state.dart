import 'package:equatable/equatable.dart';

enum HotelStatus { initial, loading, success, failure }

class HotelState<T> extends Equatable {
  const HotelState({
    this.status = HotelStatus.initial,
    this.data,
    this.errorMessage,
  });

  final HotelStatus status;
  final T? data;
  final String? errorMessage;

  HotelState copyWith({
    HotelStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return HotelState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
