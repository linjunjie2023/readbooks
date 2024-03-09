import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readbook/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    //获取屏幕的大小
    var size = MediaQuery.of(context).size;
    //确保子组件的内容不会被覆盖。在可见区域显示
    return SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              getHomeHeder(),
              SizedBox(
                height: 10,
              ),
              getHomeSearch(),
              SizedBox(
                height: 15,
              ),
            ],
          )),
    );
  }

  Widget getHomeHeder() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '你回来啦',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
            ),
          )
        ]);
  }

  Widget getHomeSearch() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.82,
          height: 40,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
            child: TextField(
              cursorColor: primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ],
    );
  }
}
