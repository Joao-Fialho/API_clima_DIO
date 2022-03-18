import 'dart:ui';

import 'package:api_clima_dio/controller/controller_clima.dart';
import 'package:api_clima_dio/repository/repositotry_clima.dart';
import 'package:api_clima_dio/view/components/clima_card.dart';
import 'package:api_clima_dio/view/components/today_card.dart';
import 'package:flutter/material.dart';

class PageClima extends StatefulWidget {
  const PageClima({Key? key}) : super(key: key);

  @override
  State<PageClima> createState() => _PageClimaState();
}

class _PageClimaState extends State<PageClima> {
  // Future<void> init() async {
  //   await controller.getRepository();
  // }

  @override
  void initState() {
    super.initState();
    // init();
  }

  final ControllerClima controller = ControllerClima(
    repository: RepositoryClima(),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.cover,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 1.5,
                    sigmaY: 1.5,
                  ),
                  child: Image.asset(
                    'assets/image/nublado.jpg',
                  ),
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return LayoutBuilder(builder: (buildcontext, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.cidade,
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          Container(
                            width: size.width * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.4,
                                  child: TextFormField(
                                    onChanged: controller.onChange,
                                    decoration: InputDecoration(
                                      labelText: 'Digite o nome de uma cidade',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade900,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade900,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      controller.getRepository();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.16,
                            width: size.width * 0.8,
                            alignment: Alignment.center,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.mapClima.forecast.length,
                              itemBuilder: (context, index) {
                                final forecast =
                                    controller.mapClima.forecast[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClimaCard(
                                      height: size.height * 0.16,
                                      day: forecast.day,
                                      temperature: forecast.temperature,
                                      wind: forecast.wind,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          TodayCard(
                            width: constraints.maxWidth * 0.95,
                            height: constraints.maxHeight * 0.4,
                            temperature: controller.mapClima.temperature,
                            wind: controller.mapClima.wind,
                            description: controller.mapClima.description,
                          ),
                        ],
                      );
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//TERMINAR A PARTE PRA COMPLETAR A URL COM O QUE O USUARIO DIGITAR
