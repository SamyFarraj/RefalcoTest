
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constant/color_app.dart';


Widget mainText(String title, Color col) {

  return    Container(
    margin: EdgeInsets.all(4),
    child: AutoSizeText(
      title,
      style:TextStyle(color: col, fontSize: 16.sp) ,
      maxLines: 2,
    ),
  );

  Text(

      title,
      style: GoogleFonts.play(color: col, fontSize: 35),
      maxLines: 2,
      softWrap:false
  );
}
Widget subtext(String title, Color col) {
  return
    SizedBox(

      child: AutoSizeText(
        //    textDirection: TextDirection.rtl,

        title,

        style:TextStyle(color:col,fontSize:12.sp) ,
        maxLines: 2,
        overflow:TextOverflow.clip,
      ),
    );
  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 30),
      maxLines: 2,
      softWrap:false
  );
}
Widget subFromSubtext(String title, Color col) {
  return
    AutoSizeText (

      title,
      style:TextStyle(color: col, fontSize: 10.sp) ,
      maxLines: 1,
      softWrap: false,
      overflow:TextOverflow.ellipsis,

    );

  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 25),
      maxLines: 1,
      softWrap:false
  );
}

Widget subPlusFromSubtext(String title, Color col) {
  return
    AutoSizeText (

      title,
      style:TextStyle(color: col, fontSize: 8.sp) ,
      maxLines: 1,
      softWrap: false,
      overflow:TextOverflow.ellipsis,

    );

  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 25),
      maxLines: 1,
      softWrap:false
  );
}



Widget mainTextNonConst(String title, Color col,double width) {

  return    Container(
    width: width,
    margin: EdgeInsets.all(4),
    child: AutoSizeText(
      title,
      style:TextStyle(color: col, fontSize: 16.sp
      ) ,
      maxLines: 2,
    ),
  );

  Text(

      title,
      style: GoogleFonts.play(color: col, fontSize: 35),
      maxLines: 2,
      softWrap:false
  );
}
Widget subtextNonConst(String title, Color col,double width,{required  bool isCenter}) {
  return
    isCenter?
    Container(
      width: width,
      child: Center(
        child: AutoSizeText(

          //    textDirection: TextDirection.rtl,

          title,
          style:TextStyle(color: col, fontSize: 12.sp) ,
          maxLines: 1,
          overflow:TextOverflow.ellipsis,
        ),
      ),
    ):
    Container(
    width: width,
    child: AutoSizeText(

      //    textDirection: TextDirection.rtl,

      title,
      style:TextStyle(color: col, fontSize: 12.sp) ,
      maxLines: 1,
      overflow:TextOverflow.ellipsis,
    ),
  );
  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 30),
      maxLines: 2,
      softWrap:false
  );
}
Widget subFromSubtextNonConst(String title, Color col,double width) {
  return
    Container(
      width: width,
      child: AutoSizeText (

        title,
        style:TextStyle(color: col, fontSize: 10.sp) ,
        maxLines: 2,
        softWrap: false,
        overflow:TextOverflow.ellipsis,

      ),
    );

  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 25),
      maxLines: 1,
      softWrap:false
  );
}



Widget subExtraFromSubtextNonConst(String title, Color col,double width) {
  return
    Container(
      width: width,
      child: AutoSizeText (

        title,
        style:TextStyle(color: col, fontSize: 10.sp) ,
        maxLines: 2,
        softWrap: false,
        overflow:TextOverflow.ellipsis,

      ),
    );

  Text(
      title,
      style: GoogleFonts.play(color: col, fontSize: 25),
      maxLines: 1,
      softWrap:false
  );
}


//app bar
AppBar customAppBar(Color color,String titleText)
{
  return AppBar(
    title: subtext(titleText, color),
    centerTitle: true,
    elevation: 0,
    foregroundColor: color,
    backgroundColor: Colors.transparent,
  );
}



push(BuildContext context,Widget page)
{
  // Navigator.of(context).push(CustomePageRoute(child:Page));
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  page),
  );

}
pushWithOutBack(BuildContext context,Widget page)
{
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) =>  page),
        (route) => false,
  );
}


Widget textWithIcon(Color colorIcons,Color colorTitleText
    ,String titleText,IconData icon,BuildContext context
    )
{
  double w = MediaQuery.of(context).size.width;

  double h=  MediaQuery.of(context).size.height;

  return Row(

    children: [
      Icon(icon,color: colorIcons,size: 25,),
      SizedBox(width: w*0.0030,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          subtext("${titleText}", colorTitleText),

        ],
      ),


    ],
  );
}

Widget customButton(String titleButton,Color colorTitleButton,Color colorButton)

{
  return Container(

    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: colorButton,
      borderRadius: BorderRadius.circular(10),

    ),
    child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: subtext(titleButton, colorTitleButton),
    ),
  );
}


Widget defaultformField({
  required String lable,
  required TextEditingController controller,
  FormFieldValidator<String>? validate,
  required TextInputType? type,
  bool isPassword = false,
  ValueChanged<String>? onSubmit,
  IconData? prefix,
  IconData? suffix,
  ValueChanged<String>? onChange,
  VoidCallback? suffixpressed,
  GestureTapCallback? onTap,
  bool? isClickable = true,
  String? hintText,
  required BuildContext context,
  required Color titleTextColor
} )
{
  var color=Theme.of(context);

  double w = MediaQuery.of(context).size.width;

  double h=  MediaQuery.of(context).size.height;
  return   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subtext(lable, titleTextColor),
      SizedBox(height:h*0.0030,),

      Container(
height: h*0.075,
        width: w*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:backgroundWaite,

        ),
        child: TextFormField(

          cursorColor: mainPurple,
          cursorWidth: 1,
          controller: controller,
          enabled: isClickable,
          validator: validate,

          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          obscureText: isPassword,
          keyboardType: type,

          decoration: InputDecoration(
            hintText:hintText ?? "" ,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            suffixIcon: suffix != null
                ? IconButton(icon: Icon(suffix), onPressed: suffixpressed)
                : null,
            suffixIconColor: mainPurple,
            prefixIcon: Icon(prefix,color: mainPurple,),
            fillColor: mainPurple,
            errorStyle: TextStyle(
                fontSize: 8.sp,

                color: Colors.red.shade400
                ,
              height: 0.1.h
            ),
            border: OutlineInputBorder(),

            errorBorder:OutlineInputBorder(

                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: backgroundWaite)
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: mainPurple)

            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: mainPurple)
            ),
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: backgroundWaite),
                borderRadius: BorderRadius.circular(20)),
            disabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: backgroundWaite),
                borderRadius: BorderRadius.circular(20)),
          ),
          onTap: onTap,
        ),
      ),
      SizedBox(height:h*0.00150,),

    ],
  );
}

Widget defaultFormFieldForBeeCell({
  required String hintText,
  required String lable,
  required TextEditingController controller,
  FormFieldValidator<String>? validate,
  required TextInputType? type,
  bool isPassword = false,
  ValueChanged<String>? onSubmit,
  IconData? prefix,
  IconData? suffix,
  ValueChanged<String>? onChange,
  VoidCallback? suffixpressed,
  GestureTapCallback? onTap,
  bool? isClickable = true,
  required BuildContext context,
  required Color titleTextColor
} )
{
  var color=Theme.of(context);

  double w = MediaQuery.of(context).size.width;

  double h=  MediaQuery.of(context).size.height;
  return   Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      SizedBox(height:h*0.0060,),

      Container(

        width: w/1.2,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10)

        ),
        child: TextFormField(

          cursorColor: color.cardColor,
          cursorWidth: 1,
          controller: controller,
          enabled: isClickable,
          validator: validate,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          obscureText: isPassword,
          keyboardType: type,

          textAlign: TextAlign.center,

          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 16.sp,
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            suffixIcon: suffix != null
                ? IconButton(icon: Icon(suffix), onPressed: suffixpressed)
                : null,
            suffixIconColor: color.secondaryHeaderColor,
            fillColor: color.cardColor,
            border: OutlineInputBorder(),
            errorStyle: TextStyle(
                fontSize: 12.sp,
                color: Colors.red.shade400
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide(color:mainPurple, width: 0),
            ),
            hintText: hintText,
errorBorder:  OutlineInputBorder(
    borderSide: BorderSide(color:  Colors.white10),
    borderRadius: BorderRadius.circular(20)),
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color:  Colors.white10),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color:  Colors.white10),
                borderRadius: BorderRadius.circular(10)),
          ),
          onTap: onTap,
        ),
      ),
      SizedBox(height:h*0.0060,),

    ],
  );
}
Widget textFromFieldCustom(
FormFieldValidator<String>? validate,
String titleField,String hintText,Color titleTextColor,TextEditingController thisController,
    TextInputType keyboardType,BuildContext context,
    Color colorContain

    )
{

  double w = MediaQuery.of(context).size.width;

  double h=  MediaQuery.of(context).size.height;
  var color=Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subFromSubtext(titleField, titleTextColor),
      SizedBox(height:h*0.0010,),
      Container(
      width: w/1.2,
height: h*0.09,

        decoration: BoxDecoration(
color: colorContain
,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TextFormField(
validator: validate,
          cursorColor:color.secondaryHeaderColor,

          controller: thisController,
          keyboardType:keyboardType ,

          style: GoogleFonts.cairo(color: color.secondaryHeaderColor, fontSize: 14.sp) ,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorContain, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText:hintText,
            label:subtext(titleField, colorContain) ,
            // suffixIcon: obSecure
            //     ? Icon(
            //   Icons.visibility,
            //   color: theme.primaryColor,
            // )
            //     : const Icon(Icons.visibility_off, color: Color.fromARGB(255, 150, 10, 10),),
          ),
        ),
      )

    ],
  );
}
Widget circular(Color circleColor)
{
  return  Center(child: CircularProgressIndicator(
    color:circleColor ,
  ),);
}

Future toastMessage (String message,BuildContext context)
{
  var color=Theme.of(context);

  double w = MediaQuery.of(context).size.width;

  double h=  MediaQuery.of(context).size.height;
  return    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor:mainPurple ,
      textColor: color.hoverColor,
      fontSize: 16.0
  );
}

snackBar(String message, bool isError,BuildContext context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: subFromSubtext(message,mainWaite),
        backgroundColor: isError ? const Color.fromARGB(255, 150, 10, 10): const Color.fromARGB(255, 10, 150, 10),
      ),
    );