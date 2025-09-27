import 'package:flutter/material.dart';
import 'package:hoov/screen/screen_home.dart';
import 'package:hoov/screen/screen_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        cardColor: const Color(0xFF00D6F5),
        canvasColor: const Color(0xFFEE5CFF),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page', index: 0,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.index});
  final int index;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  // 탭에 따른 AppBar 텍스트 리스트
  final List<String> _tabTitles = [
    "Home",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _currentIndex = widget.index;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // AppBar의 높이를 설정
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: true, // 기본 뒤로가기 버튼 표시
            title: Text(_tabTitles[_currentIndex]), // 기본 title을 null로 설정
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // 기본 뒤로가기 아이콘
              onPressed: () {
                Navigator.pop(context); // 뒤로가기 버튼 동작
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed('settings');
                },
              ),
            ],
            backgroundColor: Colors.white, // AppBar 배경색
            elevation: 0, // 그림자 없애기
            centerTitle: true, // 기본적으로 타이틀을 가운데 배치하려면 true 설정
          ),
        ),
      ),
      // 섹션별 내용
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index; // 페이지 변경 시 인덱스 업데이트
          });
        },
        children: [
          Center(child: ScreenHome()),
          Center(child: ScreenSettings()),
        ],
      ),
      // NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).focusColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: _tabTitles[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: _tabTitles[1],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

}
