import 'ReceiptItem.dart';

class Person {
    String name;



    List<ReceiptItem> assignedItems = [];

    Person({
        required this.name,
    });

    double calculateTotal () {
        double total = 0;

        for (ReceiptItem item in assignedItems) {
            total = total + item.price;
        }

        return total;
    }

    
 

}
