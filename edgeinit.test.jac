test test_check_edge_attribute1{
    created_edge =  root spawn create_edge();
    assert created_edge.node_edge[0].id=='something';
}
