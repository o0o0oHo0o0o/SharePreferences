import 'package:flutter/material.dart';
import 'package:share_preferences/widget/MyButton.dart';
import 'package:share_preferences/widget/MyTitle.dart';
import 'package:share_preferences/widget/BirthdayData.dart';
import 'package:share_preferences/widget/SexData.dart';

import '../controller/SharePreferences.dart';
class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  DateTime birthday = DateTime.now();
  List<String> sexs = [];

  @override
  void initState() {
    super.initState();
    name = MySharedPreferences.getUsername() ?? '';
    birthday = MySharedPreferences.getBirthday() ?? DateTime.now();
    sexs = MySharedPreferences.getSexs() ?? [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              MyTitle(icon: Icons.save, text: 'SharePreference'),
              const SizedBox(height: 32),
              buildName(),
              const SizedBox(height: 12),
              buildBirthday(),
              const SizedBox(height: 12),
              buildSexs(),
              const SizedBox(height: 32),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: buildTitle(
        title: 'Name',
        child: TextFormField(
          initialValue: name,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your Name',
          ),
          onChanged: (name) => setState(() {
            this.name = name;
          }),
        ),
      ),
    );
  }
  Widget buildBirthday() => buildTitle(
    title: 'Birthday',
    child: BirthdayData(
      birthday: birthday,
      onChangedBirthday: (birthday) =>
          setState(() => this.birthday = birthday),
    ),
  );
  Widget buildSexs() => buildTitle(
    title: 'Sexs',
    child: SexData(
      sexs: sexs,
      onSelectedSex: (sex) => setState(
              () => sexs.contains(sex) ? sexs.remove(sex) : sexs.add(sex)),
    ),
  );
  Widget buildButton() => MyButton(
      text: 'Save',
      onClicked: () async {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Saved successfully'),
                duration: Duration(seconds: 2),
              ),
          );
          // Lưu thông tin vào SharedPreferences
          await MySharedPreferences.setUsername(name);
          await MySharedPreferences.setBirthday(birthday);
          await MySharedPreferences.setSexs(sexs);
      });
  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}

