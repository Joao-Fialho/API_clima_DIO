import 'dart:ui';

import 'package:api_clima_dio/controller/controller_clima.dart';
import 'package:api_clima_dio/repository/repositotry_clima.dart';
import 'package:api_clima_dio/view/components/clima_card.dart';
import 'package:api_clima_dio/view/components/today_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PageClima extends StatefulWidget {
  const PageClima({Key? key}) : super(key: key);

  @override
  State<PageClima> createState() => _PageClimaState();
}

class _PageClimaState extends State<PageClima> {
  Future<void> init() async {
    await controller.getClimaByCity();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  final ControllerClima controller = ControllerClima(
    repository: RepositoryClima(dio: Dio()),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
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
                    'assets/image/ogarotodajanela.jpg',
                  ),
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black45,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return LayoutBuilder(builder: (buildcontext, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            controller.cidade,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 50),
                          ),
                          SizedBox(
                            width: size.width * 0.79,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: size.height * 0.07,
                                  width: size.width * 0.6,
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    onChanged: controller.onChange,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      labelText: 'Cidade',
                                      labelStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade600,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      controller.getClimaByCity();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.18,
                            width: size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.black45,
                            ),
                            alignment: Alignment.center,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return SizedBox(
                                width: constraints.maxWidth * 0.97,
                                height: constraints.maxHeight * 0.90,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.mapClima.forecast.length,
                                  itemBuilder: (context, index) {
                                    final forecast =
                                        controller.mapClima.forecast[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClimaCard(
                                          height: size.height * 0.15,
                                          width: size.width * 0.25,
                                          day: forecast.day,
                                          temperature: forecast.temperature,
                                          wind: forecast.wind,
                                        ),
                                        ClimaCard(
                                          height: size.height * 0.15,
                                          width: size.width * 0.25,
                                          day: forecast.day,
                                          temperature: forecast.temperature,
                                          wind: forecast.wind,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                          TodayCard(
                            width: constraints.maxWidth * 0.95,
                            height: constraints.maxHeight * 0.4,
                            iconClima: controller.getIconClima(),
                            temperature: controller.mapClima.temperature,
                            wind: controller.mapClima.wind,
                            description: controller.mapClima.description,
                            cidade: controller.cidade,
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
