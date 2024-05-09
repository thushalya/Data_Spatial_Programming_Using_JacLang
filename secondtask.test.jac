# test test_add_memory_walker{
#     json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
#     m=root spawn create_graph(json_file=json_file["report"][0]);

#     created_node =  root spawn create(date="2024-04-30",items=["something","laundry"]);
#     assert created_node.date=="2024-04-30";
#     assert created_node.items==["something","laundry"];

# }

import:py json;

# test test_create_graph{
#     json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
#     graph = root spawn create_graph(json_file=json_file["report"][0]);
#     print(graph.node_list);
#     assert graph.node_list["urn:uuid:d2f48ca2-45b9-40ad-9cc5-aca16f4d1ec5"].jid == "urn:uuid:d2f48ca2-45b9-40ad-9cc5-aca16f4d1ec5";
#     assert graph.node_list["urn:uuid:aa0aba6d-aea0-41ea-85e3-d38249c255fc"].jid == "urn:uuid:aa0aba6d-aea0-41ea-85e3-d38249c255fc";
#     assert graph.node_list["urn:uuid:3f5c226d-0be6-442a-9783-bf1f6f6473a6"].jid == "urn:uuid:3f5c226d-0be6-442a-9783-bf1f6f6473a6";
#     assert graph.node_list["urn:uuid:a0dbea3f-8615-44eb-9ca1-3e122e3c0643"].jid == "urn:uuid:a0dbea3f-8615-44eb-9ca1-3e122e3c0643";
#     assert graph.node_list["urn:uuid:9659dd66-c4f9-4361-8dd4-9245049c723f"].jid == "urn:uuid:9659dd66-c4f9-4361-8dd4-9245049c723f";
#     assert graph.node_list["urn:uuid:85dedc77-e74b-4d6e-ba95-a0f978d52155"].jid == "urn:uuid:85dedc77-e74b-4d6e-ba95-a0f978d52155";
#     assert graph.node_list["urn:uuid:af3dd7d7-560b-4858-ac6c-9be74d55541f"].jid == "urn:uuid:af3dd7d7-560b-4858-ac6c-9be74d55541f";
#     assert graph.node_list["urn:uuid:f0b93be3-7601-45da-af66-3dcef0605e2c"].jid == "urn:uuid:f0b93be3-7601-45da-af66-3dcef0605e2c";
#     assert graph.node_list["urn:uuid:2961ddcf-af56-4248-8124-8c5b4f4fa963"].jid == "urn:uuid:2961ddcf-af56-4248-8124-8c5b4f4fa963";
#     assert graph.node_list["urn:uuid:b614a7f7-d50a-488e-8c0e-c94539766401"].jid == "urn:uuid:b614a7f7-d50a-488e-8c0e-c94539766401";
#     assert graph.node_list["urn:uuid:1fa8952c-1f62-4581-bae4-9438f8e4ade1"].jid == "urn:uuid:1fa8952c-1f62-4581-bae4-9438f8e4ade1";


# # }

# node workette{
#     has jid: string="";
#     # has data:dict ={};
# }


# node day{
#     has jid: string="";
#     # has data:dict ={};

# }

test test_traverse_graph{
    json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
    graph = root spawn create_graph(json_file=json_file["report"][0]);
    graph_traverse = root spawn traverse_graph();
    # print(graph_traverse);
    print("\nday nodes",graph_traverse.day_nodes);
    print("\n middle nodes",graph_traverse.workette_nodes);
    print("\nbottom nodes",graph_traverse.bottom_workette_nodes);
    # print(graph_traverse.middle_workette_nodes[0].jid);
    # print(graph_traverse.middle_workette_nodes[1].jid);
    # print(graph_traverse.middle_workette_nodes[2].jid);
    # print(graph_traverse.middle_workette_nodes[3].jid);
    # print(type(graph_traverse.workette_nodes));
    # print(type(graph_traverse.day_nodes[0]));
    assert "urn:uuid:d2f48ca2-45b9-40ad-9cc5-aca16f4d1ec5" in graph_traverse.day_nodes[0].jid;
    middle_nodes_jid = [i.jid for i in graph_traverse.workette_nodes];
    bottom_nodes_jid = [i.jid for i in graph_traverse.bottom_workette_nodes];
    # print(middle_nodes_jid);
    # assert day(jid="urn:uuid:d2f48ca2-45b9-40ad-9cc5-aca16f4d1ec5") in graph_traverse.day_nodes;
    assert "urn:uuid:922e31f3-2ca0-45f6-8d13-fda1b7ed8e44" in middle_nodes_jid;
    assert "urn:uuid:c6254a50-8e14-4a0c-ad99-8e8ca019c174" in middle_nodes_jid;
    assert "urn:uuid:6aa1072f-a8fa-4683-a5b1-6709aa294afb" in middle_nodes_jid;
    assert "urn:uuid:5db2e4ea-b309-4f72-8220-30b6090e138a" in middle_nodes_jid;

    assert "urn:uuid:a0dbea3f-8615-44eb-9ca1-3e122e3c0643" in bottom_nodes_jid;
    assert "urn:uuid:9659dd66-c4f9-4361-8dd4-9245049c723f" in bottom_nodes_jid;
    assert "urn:uuid:85dedc77-e74b-4d6e-ba95-a0f978d52155" in bottom_nodes_jid;
    assert "urn:uuid:aa0aba6d-aea0-41ea-85e3-d38249c255fc" in bottom_nodes_jid;
    assert "urn:uuid:3f5c226d-0be6-442a-9783-bf1f6f6473a6" in bottom_nodes_jid;


}
