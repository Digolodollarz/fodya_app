import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fcharts/fcharts.dart';
import 'package:intl/intl.dart';

class BarnData {
  int id;
  String station;
  int status;
  double humidity;
  int smoke;
  int fire;
  DateTime date;

  BarnData(
      {this.id,
      this.station,
      this.status,
      this.humidity,
      this.smoke,
      this.fire,
      this.date});

  factory BarnData.fromJson(Map<String, dynamic> json) {
    return BarnData(
      id: int.tryParse(json['id']),
      station: json['station'],
      status: int.tryParse(json['status']),
      humidity: double.tryParse(json['humidity']),
      smoke: int.tryParse(json['smoke']),
      fire: int.tryParse(json['fire']),
      date: DateTime.parse(json['Date']),
    );
  }
}

class BarnGraph extends StatelessWidget {
  final snapshot;

  BarnGraph(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 4 / 3,
      child: new LineChart(
        lines: [
          new Line<BarnData, DateTime, int>(
            data: List<BarnData>.from(snapshot.data),
            xFn: (point) => point.date,
            yFn: (point) => point.humidity.toInt(),
            stroke: const PaintOptions.stroke(
                strokeWidth: 2.0, color: Colors.white),
            legend: LegendItem(
              paint: PaintOptions.fill(
                color: Colors.white,
              ),
              text: 'Humidity',
            ),
            marker: MarkerOptions(
              shape: LineMarkerShape(),
              size: 0.0,
            ),
            yAxis: new ChartAxis(
              tickLabelFn: (humidity) => humidity.toString(),
              paint: const PaintOptions.stroke(
                color: Colors.white,
              ),
              span: new IntSpan(40, 60),
              tickGenerator: IntervalTickGenerator.byN(5),
            ),
            xAxis: new ChartAxis(
              span: TimeSpan(
                snapshot.data
                    .fold(
                        snapshot.data.first,
                        (curr, next) =>
                            curr.date.isAfter(next.date) ? curr : next)
                    .date,
                snapshot.data
                    .fold(
                        snapshot.data.first,
                        (curr, next) =>
                            curr.date.isBefore(next.date) ? curr : next)
                    .date,
              ),
              tickGenerator: IntervalTickGenerator.byDuration(
                Duration(seconds: 30),
              ),
              tickLabelFn: (val) => new DateFormat.s().format(val),
              paint: const PaintOptions.stroke(
                color: Colors.white,
              ),
            ),
          ),
          new Line<BarnData, DateTime, int>(
            data: List<BarnData>.from(snapshot.data),
            xFn: (point) => point.date,
            yFn: (point) => point.status,
            stroke: const PaintOptions.stroke(
                strokeWidth: 2.0, color: Colors.yellow),
            legend: LegendItem(
              paint: PaintOptions.fill(color: Colors.yellow),
              text: 'Temperature',
            ),
            marker: MarkerOptions(
              shape: SquareMarkerShape(),
              size: 0.0,
            ),
            yAxis: new ChartAxis(
              tickLabelFn: (humidity) => humidity.toString(),
              paint: const PaintOptions.stroke(
                color: Colors.yellow,
              ),
              span: new IntSpan(0, 50),
              tickGenerator: IntervalTickGenerator.byN(5),
              opposite: true,
            ),
            xAxis: new ChartAxis(
              span: TimeSpan(
                snapshot.data
                    .fold(
                        snapshot.data.first,
                        (curr, next) =>
                            curr.date.isAfter(next.date) ? curr : next)
                    .date,
                snapshot.data
                    .fold(
                        snapshot.data.first,
                        (curr, next) =>
                            curr.date.isBefore(next.date) ? curr : next)
                    .date,
              ),
              tickGenerator: IntervalTickGenerator.byDuration(
                Duration(seconds: 30),
              ),
              tickLabelFn: (val) => new DateFormat.s().format(val),
              paint: const PaintOptions.stroke(
                color: Colors.white,
              ),
            ),
          ),
        ],
        chartPadding: new EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
      ),
    );
  }
}

Future getBarnData() async {
  // This is how http calls are done in flutter:
  HttpClient http = new HttpClient();
  try {
    // Use darts Uri builder
    var uri = new Uri.http('barn-monitor.hurudzaafrica.com', '/data.php');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var _json = json.decode(responseBody);
    var data = _json['api_data'];
    var points = data.map((point) => BarnData.fromJson(point)).toList();
    return points;
  } catch (exception) {
    print(exception);
  }
}
