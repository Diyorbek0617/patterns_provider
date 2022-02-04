import 'package:flutter/material.dart';
import 'package:patterns_provider/viewmodel/create_view_model.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CreateViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Title",style: TextStyle(color: Colors.grey,fontSize: 20),),
                      SizedBox(height: 20,),
                      // Title
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: TextField(
                            controller: viewModel.titleTextEditingController,
                            style: TextStyle(fontSize: 20,color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Text("Content",style: TextStyle(color: Colors.grey,fontSize: 20),),
                      SizedBox(height: 20,),
                      // Body
                      Container(
                        height: 300,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: TextField(
                          controller: viewModel.bodyTextEditingController,
                          style: TextStyle(fontSize: 18,color: Colors.white),
                          maxLines: 30,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      FlatButton(
                        onPressed: (){ viewModel.apiPostCreate(context);},
                        color: Colors.blue,
                        height: 45,
                        minWidth: double.infinity,
                        child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    ],
                  ),
                ),
              ),

              viewModel.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
