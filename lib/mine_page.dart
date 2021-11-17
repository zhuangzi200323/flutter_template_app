import 'package:flutter/material.dart';
import 'package:flutter_template_app/generated/l10n.dart';
import 'package:flutter_template_app/themeAndLocal/CurrentLocale.dart';
import 'package:flutter_template_app/themeAndLocal/ThemeModel.dart';
import 'package:provider/provider.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(S.of(context).mine),
          InkWell(
            child:Card(
              child: ListTile(
                title: Text(S.of(context).theme_set),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            onTap: () async {
              int? i = await showDialog<int>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text(S.of(context).pls_select_theme),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回1
                            Navigator.pop(context, 1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(S.of(context).blue),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回2
                            Navigator.pop(context, 2);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(S.of(context).purple),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回2
                            Navigator.pop(context, 3);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(S.of(context).pink),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回2
                            Navigator.pop(context, 4);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(S.of(context).deep_pink),
                          ),
                        ),
                      ],
                    );
                  });

              if (i != null) {
                if(i==1) {
                  Provider.of<ThemeModel>(context,listen: false).setTheme('blue');
                } else if(i==2) {
                  Provider.of<ThemeModel>(context,listen: false).setTheme('purple');
                } else if(i==3) {
                  Provider.of<ThemeModel>(context,listen: false).setTheme('pink');
                } else if(i==4) {
                  Provider.of<ThemeModel>(context,listen: false).setTheme('deeppink');
                }
              }
            },
          ),
          InkWell(
            child:Card(
              child: ListTile(
                title: Text(S.of(context).lang_set),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            onTap: () async
            {
              int? i = await showDialog<int>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text(S.of(context).pls_select_theme),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回1
                            Navigator.pop(context, 1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: const Text('中文简体'),
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            // 返回2
                            Navigator.pop(context, 2);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: const Text('English'),
                          ),
                        ),
                      ],
                    );
                  });

              if (i != null) {
                if(i==1) {
                  Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('zh',"CH"));//更改语言
                } else {
                  Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('en',"US"));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}