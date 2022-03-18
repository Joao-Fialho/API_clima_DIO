import 'package:flutter/material.dart';

class ClimaCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String wind;
  final double height;
  final double width;
  const ClimaCard({
    Key? key,
    this.day = '',
    this.temperature = '',
    this.wind = '',
    this.height = 150,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Card(
          color: Colors.grey[500],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.cloud_sharp, color: Colors.white),
                  Text(
                    temperature,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Text(
                wind,
              ),
              Text(
                day,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ));
  }
}
