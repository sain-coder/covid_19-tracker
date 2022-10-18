import 'package:covid_19_tracker/Services/services_state.dart';
import 'package:covid_19_tracker/widgets/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Models/world_state_model.dart';
import 'country_list.dart';

class worldState extends StatefulWidget {
  const worldState({Key? key}) : super(key: key);

  @override
  State<worldState> createState() => _worldStateState();
}

class _worldStateState extends State<worldState> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this
  )..repeat();

  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  final colorLists = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    StateServices  stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30,left: 15,right: 15,bottom: 10),
            child: Column(
              children:  [
                FutureBuilder(
                  future: stateServices.fetchWorldRecorde() ,
                    builder: (content, AsyncSnapshot<WorldStateModel> snapshot){
                    if(!snapshot.hasData){

                      return Expanded(
                        flex: 1,
                          child: SpinKitFadingCircle(
                            controller: _controller,
                            size: 50,
                            color: Colors.white,
                          )
                      );

                    }else{
                      return Column(
                        children: [
                          PieChart (
                            dataMap: {
                              'total':double.parse(snapshot.data!.cases.toString()),
                              'Recover':double.parse(snapshot.data!.recovered.toString()),
                              'death': double.parse(snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true
                            ),
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left
                            ),
                            animationDuration: const Duration(milliseconds: 1500),
                            chartType: ChartType.ring,
                            colorList: colorLists,
                            chartRadius: MediaQuery.of(context).size.width / 3.2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .06),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                                  ReusableRow(title: 'Recover', value: snapshot.data!.recovered.toString()),
                                  ReusableRow(title: 'Death', value: snapshot.data!.deaths.toString()),
                                  ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                                  ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),

                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1aa260),
                                  borderRadius: BorderRadius.circular(10)

                              ),
                              child: const Center(
                                child: Text('Track Country',style: TextStyle(fontSize: 17),),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CountryList()));

                            },
                          ),
                        ],
                      );

                    }

                    }
                ),

              ],
            ),
          )
      ),
    );
  }
}
