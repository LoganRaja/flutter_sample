import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample01/model/album.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromInternet();
    _getDataNonAuthUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.blue,
            ),
            child: Text(
              'Sports',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Album>>(future: _getDataFromInternet(),builder: (BuildContext context,AsyncSnapshot<List<Album>> snapshot){
                if(snapshot.hasData) {
                  //Album album=snapshot.data;
                  return ListView.builder(itemBuilder: (BuildContext context,int index){
                    return Text(snapshot.data[index].title);
                  },itemCount: snapshot.data.length,);
                }
                  else if(snapshot.hasError){
                  return Text('Error'+snapshot.error.toString());
                }
                return Text('loading');
            },),
          ),
        ],
      ),
    );
  }

  Future<List<Album>> _getDataFromInternet() async{
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      return (json.decode(response.body)as List).map((obj)=>Album.fromJson(obj)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  _getDataNonAuthUser() async {
    Object object={
      "username":"test@tester.com",
      "password": "123",
      "grant_type": "password",
      "client_id": "lJYgHijgnFPO6QJhrGfBKnolygIxtezCA6YiuwAh",
      "client_secret": "V0CSwpcOwk1EPn2NlBDo20XZXmmzf7gfYbf6igkSiPaMQAGqlqiCi6gCqZ8fYIPSTNBSIWYMfZBfgmF7pOJPcMKBFDVUxK1yPqZHPcND8YBBJOxo61xODcMedGnfLJ7h"
    };

    final response = await http.post(
        Uri.parse('https://phoenix.classcover.com.au/oauth/v2/token/'), body: json.encode(object),);
    try {
      if (response.statusCode == 200) {
        print(json.decode(response.body).toString());
        Map object=json.decode(response.body);
        Map<String,String> headerMap=
        { "Accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
          "Cache-Control": "no-cache",
          "Authorization":'Bearer ${object['access_token']}',
        };
        final response1 =await http.get(Uri.parse('https://phoenix.classcover.com.au/api/v2/profile'),headers: headerMap);
        if (response1.statusCode == 200) {
          print(json.decode(response1.body).toString());
        }else{
          print('failed second api call');
        }
        
      } else {
        print('Failed to load album');
      }
    }
    catch (e) {
      print(e);
    }
  }
}
