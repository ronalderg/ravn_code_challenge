import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/generated/l10n.dart';
import 'package:ravn_code_challenge/models/people.dart';
import 'package:ravn_code_challenge/models/vehicle.dart';
import 'package:ravn_code_challenge/services/rest_api.dart';
import 'package:ravn_code_challenge/utils/utils.dart';

/// Page to show character attributes
class PersonDetailPage extends StatelessWidget {
  PersonDetailPage({Key? key, this.people}) : super(key: key);
  People? people;

  Widget characteristicRow({
    required String attributeName, required String attributeValue}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(attributeName,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)
              ),
              Text(
                  capitalize(attributeValue),
                  style: const TextStyle(fontWeight: FontWeight.bold)
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.black12,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(people!.name),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.current.generalInformation, style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              characteristicRow(attributeName: S.current.eyeColor, attributeValue: people!.eyeColor),
              characteristicRow(attributeName: S.current.hairColor, attributeValue: people!.hairColor),
              characteristicRow(attributeName: S.current.skinColor, attributeValue: people!.skinColor),
              characteristicRow(attributeName: S.current.birthYear, attributeValue: people!.birthYear),

              FutureBuilder<List<Vehicle>>(
                future: RestApi.getVehiclesOfPeople(urlVehicles: people!.vehicles!.toList()),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      List<Vehicle> vehicles = snapshot.data;
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.current.vehicles, style: const TextStyle(fontWeight: FontWeight.bold, ),),
                            const SizedBox(height: 15,),
                            ListView.builder(
                              itemCount: vehicles.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(vehicles[index].name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),
                                      const Divider(thickness: 1, color: Colors.black12,),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              S.current.failedToLoadData,
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        ]
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}
