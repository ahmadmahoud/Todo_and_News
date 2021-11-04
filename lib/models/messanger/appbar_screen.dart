import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model {
  final int id ;
  final String name ;
  final String phone ;
  final String url;

  Model({
    required this.id,
    required this.name,
    required this.phone,
    required this.url,

});

}

class Messanger extends StatelessWidget {

  List<Model> user = [
    Model(
      id: 5,
      name: 'ahmed',
      phone: '01000000000',
      url: 'https://img.freepik.com/free-vector/pastel-podium-3d-effect_52683-43788.jpg?size=626&ext=jpg'
    ),
    Model(
      id: 8,
      name: 'mohamed',
      phone: '01000000000',
      url: 'https://i.pinimg.com/736x/29/cd/3c/29cd3caa4cad15e6a4203e886039e85e.jpg'
    ),
    Model(
        id: 5,
        name: 'maher',
        phone: '010003500000',
      url: 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/6add1393834339.5e6f52ba06ab5.jpg',
    ),
    Model(
        id: 13,
        name: 'shrouk',
        phone: '01000000800',
      url: 'https://i.pinimg.com/originals/72/87/aa/7287aa92994693a8af8812bd7ccc4090.png',
    ),
    Model(
        id: 55,
        name: 'khaled',
        phone: '01000980000',
      url: 'https://image.freepik.com/free-photo/3d-illustration-smartphone-with-store-screen-with-gift-boxes-side_58466-14580.jpg'
    ),
    Model(
        id: 80,
        name: 'omer',
        phone: '01009900000',
      url: 'https://socialspecialists.co.za/wp-content/uploads/2021/08/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg',
    ),
    Model(
        id: 83,
        name: 'yaser',
        phone: '0106996000000',
      url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 32,
        name: 'nada',
        phone: '01075000000',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 56,
        name: 'esraa',
        phone: '01000036000',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 93,
        name: 'mona',
        phone: '01000007700',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 26,
        name: 'omnia',
        phone: '01000007500',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 38,
        name: 'eslam',
        phone: '01048600000',
        url: 'https://cdn.dribbble.com/users/13754/screenshots/10755240/media/c7b379724eb61a95018287e21f287b5e.png?compress=1&resize=400x300'
    ),
    Model(
        id: 146,
        name: 'aya',
        phone: '01009900000',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 74,
        name: 'naser',
        phone: '01000036000',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 5,
        name: 'fatma',
        phone: '01000000340',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
    Model(
        id: 46,
        name: 'gehan',
        phone: '01009600000',
        url: 'https://cdn.dribbble.com/users/268847/screenshots/14205173/social_4x.jpg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[900],
          title:
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://cdn.dribbble.com/users/13754/screenshots/10514046/media/75036ca28a43caf66b984a250bd1b39b.png?compress=1&resize=400x300'),
                // backgroundImage: NetworkImage(''),
              ),
              SizedBox(width: 13,),
              Text("Chat" , style: TextStyle(fontSize: 18 , color: Colors.white),),
            ],
          ),
          actions: [
            IconButton(onPressed: (){},
                icon: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 16,),
                )),
            IconButton(onPressed: (){},
                icon: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.edit, color: Colors.white, size: 16,),
                )),
          ],
        ),
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        // scroll horizontal
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15) , color: Colors.grey[700]),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text("search",)
                  ],
                ),
              ),
              Container(
                // Change the height until the problem is solved
                height: 140,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index) => buildStory(),
                    separatorBuilder: (context , index) => SizedBox(width: 15,),
                    itemCount: 12),
              ),
              ListView.separated(
                // scroll up & down
                  shrinkWrap: true,
                  // stop scroll
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index) => buildChat(user[index]) , separatorBuilder: (context , index) => SizedBox(height: 10,), itemCount: user.length),
            ],
          ),
        ),

      ),
    );
  }

  Widget buildChat(Model user) => Row (
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('${user.url}'),
          ),
          CircleAvatar(radius: 8, backgroundColor: Colors.green,),

        ],
      ),
      SizedBox(width: 12,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${user.name}" ,maxLines: 1 , overflow: TextOverflow.ellipsis ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 , fontSize: 18),),
            SizedBox(height: 5,),
            Text("${user.phone}" ,maxLines: 2 , overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white , fontWeight: FontWeight.w400 , fontSize: 11),),
          ],
        ),
      ),
      CircleAvatar(
        radius: 4,
        backgroundColor: Colors.blueAccent,
      ),
      SizedBox(width: 5,),
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: Text("${user.id}", style: TextStyle(color: Colors.white , fontSize: 12),),
      ),
    ],
  );

  Widget buildStory () => Container(
    width: 60,
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd ,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://images.milledcdn.com/2020-09-07/7K4PQLg4D1D_kROF/9Pvr832Ur5nk.png'),
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.grey[900],
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red[300],
            ),
          ],
        ),
        SizedBox(height: 5,),
        Container(
            padding: EdgeInsetsDirectional.only(start: 5),
            child: Text("ahmed mahmoud" ,style: TextStyle(color: Colors.white) , maxLines: 2 , overflow: TextOverflow.ellipsis, )),

      ],
    ),
  );

}
