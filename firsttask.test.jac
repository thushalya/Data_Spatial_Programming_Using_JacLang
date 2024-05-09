test test_add_memory_walker{
    created_node =  root spawn create(date="2024-04-30",items=["something","laundry"]);
    assert created_node.day[0].value=="2024-04-30";
    assert created_node.item_list[0][0].value =="something";
    assert created_node.item_list[1][0].value =="laundry";
}

