import 'package:flutter/material.dart';
import 'InputDeco_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  String email;
  bool hideButton = true;
  bool val = false;
  void onchange(s){
    setState(() {
      this.val =s;
    });
  }

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  //TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[800],
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent[400],
          title: Text('Baguette Box',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
          centerTitle: true,
          elevation: 10,
        ),
        body: Center(

          child: SingleChildScrollView(

            child: Form(

              key: _formkey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: Image(
                        image: AssetImage('assets/logo_bbox.png')
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email,"email"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'l\'email est requis';
                        }
                        if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                          return 'le format email n\'est pas valide';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        email = value;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(

                      controller: password,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.lock,"Mot de Passe"),
                      obscureText: true,
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Veuillez entrer le Mot de Passe';
                        }
                        if(value.length<5){return ' le mot de passe doit contenir au moins 6 caracteres ';}
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(

                      children: [
                        Checkbox(
                            activeColor: Colors.deepOrange,
                            value: val, onChanged: onchange),
                        Text(
                          'se souvenir de moi',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(

                      color: Colors.deepOrangeAccent[400],
                      onPressed: (){

                        if(_formkey.currentState.validate())
                        {
                          hideButton;

                        }else{
                         hideButton =false;
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Connexion",
                     style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                    ),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}