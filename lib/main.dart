import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/network_cubit/network_cubit.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => NetworkCubit(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vazifa"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtController,
              decoration:
                  InputDecoration(border: OutlineInputBorder(), hintText: "id"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              BlocProvider.of<NetworkCubit>(context)
                  .yuklash(txtController.text);
            },
            child: Text(("Yuklash")),
            color: Colors.green,
          ),
          SizedBox(height: 10,),
          BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, state) {
              if (state is NetworkInitial) {
                return Text("");
              } else if (state is NetworkLoading) {
                return CircularProgressIndicator();
              } else if (state is NetworkSuccess) {
                return Text(state.post.body.toString());
              } else if (state is NetworkError) {
                return Text(state.message.toString());
              } else {
                return Text("boshqa xolat");
              }
            },
          )
        ],
      ),
    );
  }
}
