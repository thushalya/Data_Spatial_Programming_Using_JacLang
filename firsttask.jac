
node day{
    has value:str;

}
node item{
    has value:str;

}
walker create{
    has date:str;
    has items: list = [];

    can create_day with `root entry{
       self.day= here ++> day(value=self.date);
       visit self.day;

    }

    can create_item with day entry{
        self.item_list=[];
        for list_item in self.items{
           node_item = here ++> item(value=list_item);
           self.item_list.append(node_item);
           visit node_item;
        }
    }

    can end with item entry{
        # print(here.value);

    }
}
# with entry{
#     root spawn create(date="2024-04-30",items=["something","laundry"]);
#     # print(dotgen(root));

# }