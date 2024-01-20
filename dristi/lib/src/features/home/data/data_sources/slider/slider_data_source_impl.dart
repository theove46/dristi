import 'package:dio/dio.dart';
import 'package:dristi/src/features/home/data/data_sources/slider/slider_data_source.dart';
import 'package:dristi/src/features/home/data/model/slider/slider_components_model.dart';
import 'package:dristi/src/features/home/data/model/slider/slider_response_model.dart';

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
