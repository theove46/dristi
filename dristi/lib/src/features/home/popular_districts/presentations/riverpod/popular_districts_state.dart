import 'package:equatable/equatable.dart';

enum PopularDistrictsStatus { initial, loading, success, failure }

class PopularDistrictState<T> extends Equatable {
  const PopularDistrictState({
    this.status = PopularDistrictsStatus.initial,
    this.data,
    this.errorMessage,
  });

  final PopularDistrictsStatus status;
  final T? data;
  final String? errorMessage;

  PopularDistrictState copyWith({
    PopularDistrictsStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return PopularDistrictState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
