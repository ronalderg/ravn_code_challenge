import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ravn_code_challenge/generated/l10n.dart';
import 'package:ravn_code_challenge/models/people.dart';
import 'package:ravn_code_challenge/models/planet.dart';
import 'package:ravn_code_challenge/models/specie.dart';
import 'package:ravn_code_challenge/pages/person_detail_page.dart';
import 'package:ravn_code_challenge/services/rest_api.dart';
import 'package:ravn_code_challenge/utils/utils.dart';

/// Page to load and show star wars' characters from multiple pages and go to
/// Person Detail Page
class PeopleOfStarWarsPage extends StatefulWidget {
  PeopleOfStarWarsPage({
    Key? key,
    this.planets,
    this.species
  }) : super(key: key);

  Map<String, dynamic>? planets;
  Map<String, dynamic>? species;

  @override
  _PeopleOfStarWarsPageState createState() => _PeopleOfStarWarsPageState();
}

class _PeopleOfStarWarsPageState extends State<PeopleOfStarWarsPage> {

  List<People> dataPeople = <People>[];
  int currentPage = 1;
  late int totalPages=0;

  final RefreshController refreshController =
    RefreshController(initialRefresh: true);

  Future<bool> getPeopleData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    final result = await RestApi.fetchPeople(currentPage: currentPage);
    if(dataPeople != null){
      if (isRefresh) {
        dataPeople = result!.results;
      }else{
        dataPeople.addAll(result!.results);
      }
      currentPage++;
      totalPages = (result.count/10).round();
      setState(() {});
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime preBackPressed = DateTime.now();
    return WillPopScope(
        onWillPop: () async {
          final timeGap = DateTime.now().difference(preBackPressed);
          preBackPressed = DateTime.now();
          if(timeGap >= const Duration(seconds: 2)){
            final snack = SnackBar(
              content: Text(S.current.pressBackButtonAgainToExit),
              duration: const Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          }else{
            SystemNavigator.pop();
            return true;
          }
        },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.peopleOfStarWars),
          centerTitle: true,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getPeopleData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getPeopleData();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    if (currentPage == totalPages) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  }
                },
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final people = dataPeople[index];
                    Planet homeWorld = widget.planets!['${getIdFromUrl(people.homeworld.toString())}'];
                    String specieName = S.current.human;
                    if(people.species != null){
                      if(people.species!.isNotEmpty){
                        Specie specie = widget.species!['${getIdFromUrl(people.species!.first.toString())}'];
                        specieName = specie.name;
                      }
                    }

                    return ListTile(
                      title: Text(
                        people.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                      subtitle: Text('$specieName ${S.current.from} ${homeWorld.name}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_sharp),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                              PersonDetailPage(people: dataPeople[index]),),
                          );
                        },
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              PersonDetailPage(people: people),),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(thickness: 1),
                  itemCount: dataPeople.length,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
