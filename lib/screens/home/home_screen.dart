import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void changeName(String name) => emit(name);
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NameCubit("alesson meu nomee"),
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc + API'),
      ),
      body: Container(
        color: Colors.greenAccent,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Seu nome',
              ),
              style: TextStyle(fontSize: ScreenUtil().setSp(16)),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
            ),
            TextButton(
              onPressed: () {
                final name = _nameController.text;

                context.read<NameCubit>().changeName(name);
              },
              child: const Text('Proximo'),
            ),
            BlocBuilder<NameCubit, String>(
              builder: (context, name) => Center(
                child: Text(name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
