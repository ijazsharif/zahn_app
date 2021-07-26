import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'logic/app_bloc/app_bloc.dart';
import 'logic/colorization_bloc/colorization_bloc.dart';
import 'presentation/common/theme/app_theme.dart';
import 'presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => AppBloc(),
        ),
        BlocProvider<ColorizationBloc>(create: (_) => ColorizationBloc()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Sizer(
            builder: (context, orientation, screenType) => MaterialApp(
              title: 'ZAHN - Colorize old Photos',
              theme: AppTheme.defaultTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
