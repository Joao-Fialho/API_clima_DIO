import 'package:flutter/material.dart';

class TodayCard extends StatelessWidget {
  final String cidade;
  final String temperature;
  final String wind;
  final String description;
  final double height;
  final double width;
  const TodayCard(
      {Key? key,
      this.temperature = 'temperatura',
      this.wind = 'Vento',
      this.description = 'Descrição',
      this.height = 150,
      this.width = 250,
      this.cidade = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.black38,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       temperature,
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 28,
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         Text(
          //           temperature,
          //           style: const TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           wind,
          //           style: const TextStyle(color: Colors.white),
          //         ),
          //       ],
          //     ),
          //     Text(
          //       description,
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   ],
          // ),
          // const Icon(
          //   Icons.wb_sunny_rounded,
          //   size: 50,
          //   color: Colors.amber,
          // ),
        ],
      ),
    );
  }
}
// Text(controller.mapClima.temperature),
                        // Text(controller.mapClima.wind),
                        // Text(controller.mapClima.description),