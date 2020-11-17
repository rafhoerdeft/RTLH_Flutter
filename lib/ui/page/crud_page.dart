import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../controller/crud_controller.dart';
// import '../../widget/dialog_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import '../../config/database/sqflite_database.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyEdit = GlobalKey<FormState>();
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlNameEdit = TextEditingController();
  TextEditingController ctrlAge = TextEditingController();
  TextEditingController ctrlAgeEdit = TextEditingController();
  final CrudController crud = Get.put(CrudController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crud.showData();
  }

  @override
  Widget build(BuildContext context) {
    txtName(bool isUpdate) {
      return TextFormField(
        controller: (isUpdate) ? ctrlNameEdit : ctrlName,
        keyboardType: TextInputType.text,
        autofocus: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Name',
          // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field must entry!';
          }
          return null;
        },
      );
    }

    txtAge(bool isUpdate) {
      return TextFormField(
        controller: (isUpdate) ? ctrlAgeEdit : ctrlAge,
        maxLength: 3,
        keyboardType: TextInputType.number,
        autofocus: false,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.portrait),
          labelText: 'Age',
          // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field must entry!';
          }
          return null;
        },
      );
    }

    buttonSave(bool isUpdate, int id) {
      return RaisedButton(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Save User',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.blue,
        shape: StadiumBorder(),
        onPressed: () {
          if (isUpdate) {
            if (_formKeyEdit.currentState.validate()) {
              crud.updateData(
                id,
                ctrlNameEdit.text,
                int.parse(ctrlAgeEdit.text),
              );
              Navigator.of(context).pop();
              ctrlNameEdit.text = '';
              ctrlAgeEdit.text = '';
            }
          } else {
            if (_formKey.currentState.validate()) {
              crud.inputData(ctrlName.text, int.parse(ctrlAge.text));
              ctrlName.text = '';
              ctrlAge.text = '';
            }
          }
        },
      );
    }

    addForm(Key keys, bool isUpdate, int id) {
      return Form(
        key: keys,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            txtName(isUpdate),
            SizedBox(height: 10),
            txtAge(isUpdate),
            SizedBox(height: 10),
            buttonSave(isUpdate, id),
            SizedBox(height: 50),
          ],
        ),
      );
    }

    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              addForm(_formKey, false, 0),
              Divider(
                thickness: 2.0,
                height: 10,
              ),
              Container(
                height: 250,
                child: Obx(
                  () => ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                    itemCount: crud.queryRows.length,
                    itemBuilder: (context, index) => Slidable(
                      key: ValueKey(index),
                      closeOnScroll: true,
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red[600],
                          icon: Icons.delete,
                          closeOnTap: true,
                          onTap: () {
                            deleteDialog(
                                context, crud.queryRows.value[index]['_id']);
                          },
                        ),
                        IconSlideAction(
                          caption: 'Update',
                          color: Colors.green[600],
                          icon: Icons.edit,
                          closeOnTap: true,
                          onTap: () {
                            ctrlNameEdit.text =
                                crud.queryRows.value[index]['name'];
                            ctrlAgeEdit.text =
                                crud.queryRows.value[index]['age'].toString();
                            showModalEdit(
                                context,
                                addForm(_formKeyEdit, true,
                                    crud.queryRows.value[index]['_id']));
                          },
                        ),
                      ],
                      dismissal: SlidableDismissal(
                        child: SlidableDrawerDismissal(),
                        closeOnCanceled: false,
                        onWillDismiss: (dynamic) {
                          deleteDialog(
                              context, crud.queryRows.value[index]['_id']);
                        },
                      ),
                      direction: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                            '${crud.queryRows.value[index]['name']} - ${crud.queryRows.value[index]['age'].toString()}'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  deleteDialog(BuildContext ctx, int id) {
    showDialog(
      context: ctx,
      child: AlertDialog(
        title: Text('Delete'),
        content: Text('Item will be deleted'),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              crud.deleteData(id);
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void showModalEdit(BuildContext context, Widget content) {
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      builder: (context, scrollController) => Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: content,
      ),
    );
  }
}
