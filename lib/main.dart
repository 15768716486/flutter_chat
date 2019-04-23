import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './search.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '聊天室',
    //自定义主题
    theme: mDefaultTheme,
    //添加路由
    routes: <String, WidgetBuilder>{
      "app" : (BuildContext context)=>new App(),
      "/friends":(_)=>new WebviewScaffold(
        //webview插件
        url: "https://flutter.io/",
        appBar:new AppBar(
          title: Text('flutter 官网'),
        ),
        withZoom:true,
        withLocalStorage:true,
      ),
      "search":(BuildContext context)=>new Search(),
    },
    home: new LoadingPage(),
  )
);

final ThemeData mDefaultTheme =new ThemeData(
<<<<<<< HEAD
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.grey
=======
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green
>>>>>>> f114d1a74a9564d0ce149bc50ebb03bffa795516
);
