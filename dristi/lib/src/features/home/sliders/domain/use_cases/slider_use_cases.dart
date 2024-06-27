import 'package:dristi/src/features/destinations_list/domain/entities/destinations_list_entity.dart';
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

  Future<List<DestinationsListEntity>> getSliderComponents(
      String appLanguage) async {
    return repository.getSliderComponents(appLanguage);
  }
}
