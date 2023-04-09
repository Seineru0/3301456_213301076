import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool valNofi1 = true;
  bool valNofi2 = false;
  bool valNofi3 = false;
  OnChangeFunction1(bool newValue1){
    setState(() {
      valNofi1 = newValue1;
    });
  }
  OnChangeFunction2(bool newValue2){
    setState(() {
      valNofi2 = newValue2;
    });
  }
  OnChangeFunction3(bool newValue3){
    setState(() {
      valNofi3 = newValue3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Hesab',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          buildAccoundOption(context, 'Şifreni Değiştir'),
          buildAccoundOption(context, 'Kullanıcı adını Değiştir'),
          buildAccoundOption(context, 'İçerik Ayarları'),
          buildAccoundOption(context, 'Sosyal '),
          buildAccoundOption(context, 'Dil Değiştir'),
          buildAccoundOption(context, 'Gizlilik Ayarları'),
          SizedBox(height: 40,),
   
          Row(
            children: [
              Icon(Icons.volume_up_outlined,color:  Colors.black45),
              SizedBox(width: 10,),
              Text('Bildirim ayarları',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
         Divider(
            height: 20,
            thickness: 1,
          ),
          SizedBox(height: 20,),
                 buildNotifOption('Dark Mod', valNofi1, OnChangeFunction1),
          buildNotifOption('Hesabı Kapat', valNofi2, OnChangeFunction2),
          buildNotifOption('Konumu Kapat', valNofi3, OnChangeFunction3),
          SizedBox(height: 50,),
          Center(
            child:  OutlinedButton(
              style:  OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(20),

                ),
                
              ),
              onPressed: (){
                
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Çıkış Yap',
                  style:  TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildNotifOption(String title, bool value, Function onChangedMethod){
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 8, horizontal: 20), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              title,
              style: const TextStyle(
                fontSize: 20,
               fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 75, 75, 75),
              ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: Colors.black,
                  trackColor: Colors.grey,
                  value: value,
                  onChanged: (bool newValue){
                    onChangedMethod(newValue);
                  },
                ),
              )

        ],
      ), 
    );

  }


  GestureDetector buildAccoundOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
              title:Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  Text('Seçenek 1'),
                  SizedBox(height: 20,),
                  Text('Seçenek 2')
                ],
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                 child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Geri')),
                 ),
              ],
          );
        }
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 75, 75, 75),
              ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),

          ],
        ),
      ),
    );
  }
}
