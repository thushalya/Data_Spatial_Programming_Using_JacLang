
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
       n= here ++> day(value=self.date);
       visit n;

    }

    can create_item with day entry{
        for list_item in self.items{
           n = here ++> item(value=list_item);
           visit n;
        }
    }

    can end with item entry{
        # print(here.value);

    }
}
with entry{
    root spawn create(date="2024-04-30",items=["something","laundry"]);
    # print(dotgen(root));

}