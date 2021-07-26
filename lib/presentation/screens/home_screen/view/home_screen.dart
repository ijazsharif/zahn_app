import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/logic/colorization_bloc/colorization_bloc.dart';
import 'package:zahn_app/presentation/common/widgets/shutter_botton.dart';
import 'package:zahn_app/presentation/screens/home_screen/widgets/info_card.dart';
import 'package:zahn_app/presentation/screens/home_screen/widgets/no_content_found.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ColorizationBloc>(context).add(
      GetColorizedPhotosList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<ColorizationBloc, ColorizationState>(
              buildWhen: (previous, current) =>
                  current is SuccessfullyGetColorizedPhotosList ||
                  current is ColorizedPhotosListIsEmpty,
              builder: (context, state) {
                print(state);
                if (state is ColorizedPhotosListIsEmpty) {
                  return NoContentFound();
                }
                if (state is SuccessfullyGetColorizedPhotosList) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.only(top: 7.0.h),
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      return ColorizedImageCard(
                        position: index,
                        filePath: state.photos[index],
                      );
                    },
                  );
                }
                return Center(child: CupertinoActivityIndicator());
              }),
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
