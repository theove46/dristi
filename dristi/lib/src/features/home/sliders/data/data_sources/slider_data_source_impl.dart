import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/sliders/data/data_sources/slider_data_source.dart';
import 'package:dristi/src/features/home/sliders/data/model/slider_components_model.dart';
import 'package:dristi/src/features/home/sliders/data/model/slider_response_model.dart';

class SliderDataSourceImp implements SliderDataSource {
  const SliderDataSourceImp();

  @override
  Future<Response> sliderComponents() async {
    List<SliderComponentsModel> sliderComponents =
        SliderComponentsModel.fetchAllData();

    SliderResponseModel response =
        SliderResponseModel.fromSliderComponentsModel(sliderComponents);

    return Response(
      requestOptions: RequestOptions(),
      statusMessage: response.message,
      data: response.data,
    );
  }
}
