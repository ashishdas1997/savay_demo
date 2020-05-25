import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savaydemo/screens/category_card.dart';
import '../models/article.dart';
import '../services/article_services.dart';

class EditArticleScreen extends StatefulWidget {
  static const routeName = '/edit-article';
  @override
  _EditArticleScreenState createState() => _EditArticleScreenState();
}

class _EditArticleScreenState extends State<EditArticleScreen> {
  final imageLinkFocusNode = FocusNode();
  final contentTypeFocusNode = FocusNode();
  final typeFocusNode = FocusNode();
  final addedTimeFocusNode = FocusNode();
  final form = GlobalKey<FormState>();
  var editedArticle = Article(
      id: null,
      title: "",
      imageLink: "",
      contentType: "",
      type: "",
      addedTime: "");

  var isLoading = false;

  @override
  void dispose() {
    imageLinkFocusNode.dispose();
    contentTypeFocusNode.dispose();
    typeFocusNode.dispose();
    addedTimeFocusNode.dispose();
    super.dispose();
  }

  void saveForm() {
    final isValid = form.currentState.validate();
    if(!isValid){
      return;
    }
    form.currentState.save();
    setState(() {
      isLoading= true;
    });
    Provider.of<AllServices>(context, listen: false).addArticle(editedArticle).then((_){
      setState(() {
        isLoading=false;
      });
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Article'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveForm,
          )
        ],
      ),
      body: isLoading? Center(
        child: CircularProgressIndicator(),
      )
          :Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: form,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(imageLinkFocusNode);
                  },
                  validator: (value){
                    if(value.isEmpty) {
                      return "Please enter a valid Title";
                    }
                    return null;
                  },

                  onSaved: (value) {
                    editedArticle = Article(
                      id: null,
                        title: value,
                        imageLink: editedArticle.imageLink,
                        contentType: editedArticle.contentType,
                        type: editedArticle.type,
                        addedTime: editedArticle.addedTime);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image Link'),
                  textInputAction: TextInputAction.next,
                  focusNode: imageLinkFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(contentTypeFocusNode);
                  },
                  validator: (value){
                    if(value.isEmpty) {
                      return "Please enter a valid Image";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editedArticle = Article(
                      id: null,
                        title: editedArticle.title,
                        imageLink: value,
                        contentType: editedArticle.contentType,
                        type: editedArticle.type,
                        addedTime: editedArticle.addedTime);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Content Type'),
                  textInputAction: TextInputAction.next,
                  focusNode: contentTypeFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(typeFocusNode);
                  },
                  validator: (value){
                    if(value.isEmpty) {
                      return "Please enter a valid Content Type";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editedArticle = Article(
                      id: null,
                        title: editedArticle.title,
                        imageLink: editedArticle.imageLink,
                        contentType: value,
                        type: editedArticle.type,
                        addedTime: editedArticle.addedTime);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Type'),
                  textInputAction: TextInputAction.next,
                  focusNode: typeFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(addedTimeFocusNode);
                  },
                  validator: (value){
                    if(value.isEmpty) {
                      return "Please enter a valid Type";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editedArticle = Article(
                      id: null,
                        title: editedArticle.title,
                        imageLink: editedArticle.imageLink,
                        contentType: editedArticle.contentType,
                        type: value,
                        addedTime: editedArticle.addedTime);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Added Time'),
                  textInputAction: TextInputAction.next,
                  focusNode: addedTimeFocusNode,
                  onFieldSubmitted: (_) {
                    saveForm();
                  },
                  validator: (value){
                    if(value.isEmpty) {
                      return "Please enter a valid Added Time";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editedArticle = Article(
                      id: null,
                        title: editedArticle.title,
                        imageLink: editedArticle.imageLink,
                        contentType: editedArticle.contentType,
                        type: editedArticle.type,
                        addedTime: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
