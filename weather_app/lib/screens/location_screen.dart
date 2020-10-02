import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locWeather});
  final locWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temp;
  String weatherIcon = "A";
  String cityName;
  String weatherMsg;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherIcon = 'Error';
        weatherMsg = 'Unable to get data';
        cityName = '';
        return;
      }
      temp = weatherData['main']['temp'].toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMsg = weatherModel.getMessage(temp);
      cityName = weatherData['name'];
    });
  }

  @override
  void initState() {
    updateUI(widget.locWeather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: () async {
                var weatherData = await weatherModel.getLocWeather();
                updateUI(weatherData);
              },
              child: Text(
                'Navigate',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 150, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temp',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    weatherIcon,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 200, 30, 10),
              child: Text(
                '$weatherMsg in $cityName',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
