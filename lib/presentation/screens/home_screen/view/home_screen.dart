import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/presentation/common/widgets/shutter_botton.dart';
import 'package:zahn_app/presentation/screens/home_screen/widgets/info_card.dart';
import 'package:zahn_app/presentation/screens/home_screen/widgets/no_content_found.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataBaseHelper _dataBaseHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _dataBaseHelper.colorizedPhotosList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.length != 0) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.only(top: 7.0.h),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ColorizedImageCard(
                        position: index,
                        filePath: snapshot.data[index],
                      );
                    },
                  );
                } else {
                  return NoContentFound();
                }
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: ShutterBotton(
        onTap: () async {
          Navigator.pushNamed(context, 'colorizeImage');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
