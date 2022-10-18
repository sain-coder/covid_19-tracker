import 'package:covid_19_tracker/Services/services_state.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'details_screens.dart';

class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Search with country name..!',
                    hintStyle: TextStyle(fontSize: 19.0),
                    contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: stateServices.countryListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                        color: Colors.white,
                                        width: 80,
                                        height: 10,
                                      ),
                                      subtitle: Container(
                                        color: Colors.white,
                                        width: 80,
                                        height: 10,
                                      ),
                                      leading: Container(
                                        color: Colors.white,
                                        width: 50,
                                        height: 50,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              if (searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString()),
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag'])),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    critical: snapshot.data![index]
                                                        ['critical'],
                                                    active: snapshot.data![index]
                                                        ['active'],
                                                    deaths: snapshot.data![index]
                                                        ['deaths'],
                                                    recovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    cases: snapshot.data![index]
                                                        ['cases'],
                                                    tests: snapshot.data![index]
                                                        ['test'])));
                                      },
                                    )
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    InkWell(
                                      child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString()),
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag'])),
                                      ),
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    name: snapshot.data![index]
                                                    ['country'],
                                                    image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                    critical: snapshot.data![index]
                                                    ['critical'],
                                                    active: snapshot.data![index]
                                                    ['active'],
                                                    deaths: snapshot.data![index]
                                                    ['deaths'],
                                                    recovered:
                                                    snapshot.data![index]
                                                    ['recovered'],
                                                    cases: snapshot.data![index]
                                                    ['cases'],
                                                    tests: snapshot.data![index]
                                                    ['test'])));
                                      },
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    })
                // FutureBuilder(
                //   builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                //     return ListView.builder(itemBuilder: (context, index){
                //       return Column(
                //         children: [],
                //       );
                //     }
                //
                //     );
                //   },
                // ),
                )
          ],
        ),
      ),
    );
  }
}
