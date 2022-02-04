import 'package:flutter/material.dart';
import 'package:patterns_provider/viewmodel/update_view_model.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.title;
    viewModel.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Post'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<UpdateViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Title",style: TextStyle(color: Colors.black,fontSize: 20),),
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
                      Text("Content",style: TextStyle(color: Colors.black,fontSize: 20),),
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
                        onPressed: (){ viewModel.apiPostUpdate(context);},
                        height: 45,
                        minWidth: double.infinity,
                        color: Colors.blue,
                        child: Text("Update",style: TextStyle(color:Colors.white,fontSize: 18),),
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
