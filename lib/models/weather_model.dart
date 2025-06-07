class Weather {
  String weatherCondition;
  String weatherDescription;
  double mainTemp;
  double minTemp;
  double maxTemp;
  int pressure;
  int humidity;

  Weather({
    required this.weatherCondition,
    required this.weatherDescription,
    required this.mainTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
  });

  static Weather parseJson(dynamic json) {
    return Weather(
      weatherCondition: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      mainTemp: json['main']['temp'],
      minTemp: json['main']['temp_min'],
      maxTemp: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
    );
  }

  static String convertFahrenheitToCelsius(String temp) {
    double t = double.parse(temp);
    t = t - 273.15;
    return t.toStringAsFixed(2);
  }
}
