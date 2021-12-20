import 'package:flutter/material.dart';
import 'package:reports/screen/location_filter.dart';

class LocationScreen extends StatefulWidget {
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> _mainList = [
    '경기',
    '서울',
    '부산',
    '경남',
    '인천',
    '경북',
    '대구',
    '충남/세종',
    '전남',
    '전북',
    '충북',
    '대전',
    '강원',
    '제주',
  ];
  List<bool> _mainSelectedList = [true] + List.filled(13, false);

  final List<String> _subList1 = [
    '수원',
    '고양',
    '용인',
    '성남',
    '화성',
    '부천',
    '남양주',
    '안산',
    '안양',
    '평택',
    '시흥',
    '파주',
    '의정부',
    '김포',
    '광주',
    '광명/과천',
    '오산',
    '군포',
    '의왕',
    '하남',
    '이천',
    '안성',
    '김포',
    '여주',
    '양평',
    '동두천',
    '구리',
    '양주',
    '포천',
    '연천',
    '가평',
  ];

  int n = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 40,
            child: Text(
              '지역',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: MediaQuery.of(context).size.height - 137,
                child: Center(
                  child: ListView.builder(
                    itemCount: _mainList.length,
                    // separatorBuilder: (context, index) {
                    //   return Divider(
                    //     thickness: 0.5,
                    //     color: Colors.grey,
                    //   );
                    // },
                    itemExtent: 60,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                      title: Text(
                        '${_mainList[index]}',
                        style: TextStyle(
                          height: 2.5,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      selectedTileColor: Colors.white,
                      tileColor: Colors.black12,
                      selected: _mainSelectedList[index],
                      onTap: () {
                        for (int i = 0; i < _mainSelectedList.length; i++) {
                          _mainSelectedList[i] = (i == index) ? true : false;
                        }
                        setState(() {});
                        n = index;
                      },
                    ),
                  ),
                ),
              ),
              if (n == 0)
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 137,
                    child: Center(
                      child: ListView.builder(
                        itemCount: _subList1.length,
                        itemExtent: 40,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                          title: Text(
                            // '${_subList1[index]}',
                            '   ${_subList1[index]}',
                            style: TextStyle(
                              height: -0.2,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                          ),
                          tileColor: Colors.white24,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LocationFilterScreen()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
