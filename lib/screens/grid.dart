import 'package:flutter/material.dart';
import 'package:grid/model/product.dart';
import 'package:grid/model/DataSource.dart';
import 'dart:io';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:grid/screens/addData.dart';



class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  late Map<String, double> columnWidths = {
  'id': double.nan,
  'name': double.nan,
  'price': double.nan,
  'orderNo': double.nan,
  'qty': double.nan,
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Receipt'),
        backgroundColor: Colors.greenAccent[100],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 700,
                  height: 500,
                  padding:Platform.isAndroid ? const EdgeInsets.all(1):const EdgeInsets.all(5),
                  margin: Platform.isAndroid ? const EdgeInsets.all(10):const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                    boxShadow:const[
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 2,
                         ),
                    ]
                  ),
                  child: Container(
                    alignment: Alignment.center,
                   
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        gridLineColor: Colors.black,
                        gridLineStrokeWidth: 1.0,
                        headerColor: Colors.greenAccent,
                        headerHoverColor: Colors.blueAccent[100],
                        rowHoverColor: Colors.greenAccent[100],
                      ),
                      child: SfDataGrid(
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        columnWidthMode:  Platform.isAndroid ? ColumnWidthMode.none : ColumnWidthMode.fill,
                        allowColumnsResizing: true,
                        columnResizeMode: ColumnResizeMode.onResize,
                        allowSorting: true,
                        source: MyDataSource(productData, context),
                        allowEditing: true,
                        selectionMode: SelectionMode.multiple,

                        onColumnResizeUpdate:(ColumnResizeUpdateDetails details){
                          setState(() {
                              columnWidths[details.column.columnName] = details.width;
                                  });
                                   return true;
                                  },

                        columns: <GridColumn>[
                          GridColumn(
                            width: columnWidths['id']!,
                            columnName: 'id',
                            label: Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'ID',
                                ))),
                          GridColumn(
                              width: columnWidths['name']!,
                              columnName: 'name',
                              label: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child: const Text('Name'))),
                          GridColumn(
                              width: columnWidths['price']!,
                              columnName: 'price',
                              label: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child: const Text('Price \$'))),
                          GridColumn(
                              width: columnWidths['orderNo']!,
                              columnName: 'orderNo',
                              label: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child: const Text('OrderNo'))),
                          GridColumn(
                              width: columnWidths['qty']!,
                              columnName: 'qty',
                              label: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child: const Text('Qty'))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddProductDialog((Product newProduct) {
                      setState(() {
                        productData.add(newProduct);
                      });
                    });
                  },
                );
              },
              color: Colors.greenAccent, 
              elevation: 5.0,
              height: 60.0, 
              minWidth: 200.0, 
              padding: const EdgeInsets.all(16.0), 
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), 
          ),
              child:const Text('Add data'),
            ),
          ],
        ),
      ),
    );
  }
}
