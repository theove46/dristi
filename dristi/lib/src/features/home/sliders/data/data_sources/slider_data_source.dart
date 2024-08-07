import 'package:dristi/src/features/destinations_list/data/models/destinations_list_response_model.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderDataSourceProvider = Provider<SliderDataSource>(
  (ref) {
    return SliderDataSourceImp();
  },
);

abstract class SliderDataSource {
  Future<DestinationsListResponseModel> sliderComponents(String appLanguage);
}
