import 'package:estudo_flutter/bloc/users/user_bloc.dart';
import 'package:estudo_flutter/bloc/users/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc()..add(LoadUser()),
      child: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return const CircularProgressIndicator(
                color: Colors.red,
              );
            }

            if (state is UserLoaded) {
              return ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                    child: Text('Quantidade usuarios: ${state.users.length}'),
                  ),
                  for (var user in state.users)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(40),
                          vertical: ScreenUtil().setHeight(2)),
                      child: ListTile(
                        leading: const Icon(Icons.supervised_user_circle),
                        trailing: const Icon(Icons.menu),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        onTap: () =>
                            print('clicado no usuario com id ${user.id}'),
                      ),
                    ),
                  TextButton(
                    onPressed: () {
                      context.read<UserBloc>().add(AddUser(UserModel.users[0]));
                    },
                    child: const Text('adicionar usuario'),
                  ),
                ],
              );
            }

            return Text('sem status definidos');
          },
        ),
      ),
    );
  }
}
