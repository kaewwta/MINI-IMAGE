import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter/pages/viewuser.dart';
import 'package:flitter/utils/variables.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<QuerySnapshot> searchuseresult;
  searchuser(String s) {
    var users =
        usercollection.where('username', isGreaterThanOrEqualTo: s).get();

    setState(() {
      searchuseresult = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffECE5DA),
        appBar: AppBar(
          title: TextFormField(
            decoration: InputDecoration(
                filled: true,
                hintText: "ค้นหาผู้ใช้  . . . ",
                hintStyle: mystyle(18)),
            onFieldSubmitted: searchuser,
          ),
        ),
        body: searchuseresult == null
            ? Center(
                child: Text(
                  "ค้นหาผู้ใช้  . . . ",
                  style: mystyle(30),
                ),
              )
            : FutureBuilder(
                future: searchuseresult,
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot user = snapshot.data.docs[index];
                      return Card(
                        elevation: 8.0,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(user.data()['profilepic']),
                          ),
                          title: Text(
                            user.data()['username'],
                            style: mystyle(25),
                          ),
                          trailing: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViewUser(user.data()['uid']))),
                            child: Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text("ดูโปรไฟล์", style: mystyle(20)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ));
  }
}
