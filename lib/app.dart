import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts.dart';
import './find/find.dart';
import './personal/personal.dart';

//应用页面使用有状态Widget
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

//应用页面状态实现类
class AppState extends State<App> {
  //当前选中页面索引
  var _currentIndex = 0;

  //聊天页面
  MessagePage message;

  //好友页面
  Contacts contacts;

  //发现页面
  Find find;

  //我的页面
  Personal me;

  //根据当前索引返回不同的页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (find == null) {
          find = new Find();
        }
        return find;
      case 3:
        if (me == null) {
          me = new Personal();
        }
        return me;
      default:
    }
  }

  //渲染某个菜单项 传入菜单标题 图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          //判断是使用图片路径还是图标
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          //显示菜单项文本内容
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          Padding(
            //左右内边距
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //弹出菜单
                showMenu(
                  context: context,
                  //定位在界面的右上角
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  //展示所有菜单项
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起群聊',
                        imagePath: 'images/icon_menu_group.png'),
                    _popupMenuItem('添加好友',
                        imagePath: 'images/icon_menu_addfriend.png'),
                    _popupMenuItem('扫一扫', 
                        imagePath: 'images/icon_menu_scan.png'),
                     _popupMenuItem('收付款', 
                        imagePath: 'images/icon_menu_scan.png'),
                     _popupMenuItem('帮助与反馈', 
                        imagePath: 'images/icon_menu_help.png'),
                  ],
                );
              },
              //菜单按钮
              child: Icon(Icons.add_circle_outline),
            ),
          ),
        ],
      ),
      //底部导航按钮
      bottomNavigationBar: new BottomNavigationBar(
        //通过fixedColor设置选中item 的颜色
        type: BottomNavigationBarType.fixed,
        //当前页面索引
        currentIndex: _currentIndex,
        //按下后设置当前页面索引
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航按钮项
        items: [
          //导航按钮项传入文本及图标
          new BottomNavigationBarItem(
              title: new Text(
                '微信',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xFF000000)),
              ),
              //判断当前索引作图片切换显示
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/message_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                '通讯录',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xFF000000)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                      'images/contact_list_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/contact_list_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                '发现',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xFF000000)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                      'images/icon_find_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/icon_find_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                '我',
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xFF46c01b)
                        : Color(0xFF000000)),
              ),
              icon: _currentIndex == 3
                  ? Image.asset(
                      'images/profile_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
        ],
      ),
      //中间显示当前页面
      body: currentPage(),
    );
  }
}
