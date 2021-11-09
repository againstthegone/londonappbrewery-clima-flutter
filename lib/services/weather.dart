import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static const _appid = 'c029cfbbee8e7d8e8aa732f185cddd4a';

  Future<dynamic> getCityWeather(String city) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
      createHttpsUri(city: city),
    );
    return await networkingHelper.getNetworkData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper(
      createHttpsUri(
          latitude: location.latitude, longitude: location.longitude),
    );
    return await networkingHelper.getNetworkData();
  }

  Uri createHttpsUri({double latitude, double longitude, String city}) {
    final Map<String, String> query = {
      'appid': _appid,
      'units': 'metric',
    };

    if (latitude != null) {
      query['lat'] = '$latitude';
    }
    if (longitude != null) {
      query['lon'] = '$longitude';
    }
    if (city != null) {
      query['q'] = '$city';
    }

    return Uri.https(
      'api.openweathermap.org',
      'data/2.5/weather',
      query,
    );
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
