import '/api/api_repository.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';

class WeatherService {
  final String city;
 String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=eea7f7d91c7ea088d0f0f71f0af5416d';

  WeatherService({required this.city});

  void getCurrentWeatherData({
    required Function() beforSend,
    required Function(CurrentWeatherData currentWeatherData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepository(
      url: '$url', payload: {},
    ).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }

  void getFiveDaysThreeHoursForcastData({
    required Function() beforSend,
    required Function(List<FiveDayData> fiveDayData) onSuccess,
    required Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(
      url: '$url', payload: {},
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              print(error),
              onError(error),
            });
  }
}
