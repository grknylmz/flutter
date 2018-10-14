import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/blocs/bloc_provider.dart';

void main() => runApp(
  BlocProvider<ApplicationBloc>(
    bloc: ApplicationBloc(),
    child: new App(),
  )
);
