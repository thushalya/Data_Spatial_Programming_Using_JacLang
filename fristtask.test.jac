test test_add_memory_walker{

    created_node =  root spawn create(date="2024-04-30",items=["something","laundry"]);
    assert created_node.date=="2024-04-30";
    assert created_node.items==["something","laundry"];

}

