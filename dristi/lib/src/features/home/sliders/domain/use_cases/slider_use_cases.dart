import 'package:dristi/src/features/destinations/domain/entities/destination_entity.dart';
import 'package:dristi/src/features/home/sliders/domain/repositories/slider_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderUseCaseProvider = Provider(
  (ref) {
    return SliderUseCase(
      ref.read(sliderRepositoryProvider),
    );
  },
);

class SliderUseCase {
  SliderUseCase(this.repository);

  final SliderRepository repository;

  Future<List<DestinationEntity>> getSliderComponents() async {
    return repository.getSliderComponents();
  }
}
