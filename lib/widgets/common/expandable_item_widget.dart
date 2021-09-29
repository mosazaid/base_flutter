
import 'package:flutter/material.dart';

class ExpandableItem extends StatefulWidget{

  final List<String>listItems;
  final String headerTitle;

  ExpandableItem(this.headerTitle,this.listItems);

  @override
   _ExpandableItemState createState() => _ExpandableItemState();
  
}
class _ExpandableItemState extends State<ExpandableItem>
{
  bool isExpand=false;
  @override
  void initState() {
    super.initState();
    isExpand=false;
  }
  @override
  Widget build(BuildContext context) {
    List<String>listItem=this.widget.listItems;
    return  Container(
      child: Padding(
        padding: (isExpand==true)?const EdgeInsets.all(6.0):const EdgeInsets.all(8.0),
        child: Container(
            decoration:BoxDecoration(
                color: Colors.white,
               borderRadius: (isExpand!=true)?BorderRadius.all(Radius.circular(50)):BorderRadius.all(Radius.circular(25)),
              
          
                

                
            ),
          child: ExpansionTile(
            key: PageStorageKey<String>(this.widget.headerTitle),
            title: Container(
                width: double.infinity,
             
                child: Text(this.widget.headerTitle,style: TextStyle(fontSize: (isExpand!=true)?18:22,color: Colors.black,fontWeight: FontWeight.bold),)),
                
             trailing: (isExpand==true)?Icon(Icons.keyboard_arrow_up,color: Colors.black,):Icon(Icons.keyboard_arrow_down,color: Colors.black),
            onExpansionChanged: (value){
              setState(() {
                isExpand=value;
              });
            },
            children: [
              for(final item in listItem)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                print(Text("Selected Item $item "+this.widget.headerTitle ));
               //========Stop Snak bar=========== Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,duration:Duration(microseconds: 500),content: Text("Selected Item $item "+this.widget.headerTitle )));
              },
              child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                  color: Colors.white,
              
                  border: Border(top: BorderSide(color: Theme.of(context).dividerColor))
              ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item,style: TextStyle(color: Colors.black),),
                    
                  )),
            ),
          )


            ],

          ),
        ),
      ),
    );
  }
}