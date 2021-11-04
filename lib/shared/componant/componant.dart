
import 'package:first_app/models/news_api/web_view/webView.dart';
import 'package:first_app/models/todo/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );



Widget buildTaskItem(Map? model, context) => Dismissible(
      key: Key(model!['id']!.toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']!);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                icon: Icon(Icons.check_box_rounded, color: Colors.green),
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                }),
            IconButton(
                icon: Icon(Icons.archive_rounded, color: Colors.red),
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                }),
          ],
        ),
      ),
    );

Widget buildTask({BuildContext? context, List<Map?>? tasks}) {
  return Conditional.single(
    context: context!,
    widgetBuilder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(tasks![index], context),
      separatorBuilder: (context, index) =>
          Container(width: double.infinity, height: 1.0),
      itemCount: tasks!.length,
    ),
    conditionBuilder: (context) => tasks!.length > 0,
    fallbackBuilder: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100.0,
          ),
          Text(
            'No Tasks added yet start add some',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    ),
  );
}

Widget buildLine() =>  Container(width: double.infinity, height: 1.0);

Widget buildNews(article , context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text('${article['title']}' , maxLines: 3 , overflow: TextOverflow.ellipsis ,   style: Theme.of(context).textTheme.bodyText1)),
                Text('${article['publishedAt']}' , style: Theme.of(context).textTheme.bodyText2),

              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget buildArticle(list , context , {isSearch = false})=> Conditional.single(
    context: context,
    conditionBuilder: (context)=> list.length > 0,
    widgetBuilder: (context)=> ListView.separated(
      // يقوم بإلغاء العلامه الزرقاء عند الصعود الى الاعلى او النزول للاسفل ويجعلها بشكل مطاطي
        physics: BouncingScrollPhysics(
        ),
        itemBuilder: (context , index) => buildNews(list[index] , context),
        separatorBuilder: (context , index) => buildLine(),
        itemCount: 10 ),
    fallbackBuilder: (context)=> isSearch ? Container() : Center(child: CircularProgressIndicator())
);

void navigateTo(context , widget)=>
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> widget));


