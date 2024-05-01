import:py json;


##Load Json

## Recreate the graph

## Traverse the graph and printout it

##connect an edge
## delete a node



can gen_node(node_info:dict) -> day | workette | None{
    return_node: day | workette | None = None;
    if node_info["name"] == "day" {
        return_node = day(node_info["context"]);

    }elif node_info["name"] == "workette"{
        return_node = workette(node_info["context"]);
    }else{
        print("node type not supported");
    }
    return return_node;

}

can gen_edge(edge_info: dict) -> edge | None {
    return_edge = None;
    if edge_info["name"] == "parent" {
        return_edge = parent();
    } else {
        print("edge type not supported");
    }
    return return_edge;
}


###what is can?
"""
Nodes def

"""
node day{
    has data:dict ={};

}

node workette{
    has data:dict ={};
}

"""
Edges def

"""

edge parent{}


"""Walker def"""
walker traverse_graph{
    can go_to_day with root entry{

    }
    can go_to_workette with day entry{


    }
    can end with workette entry{

    }
}

walker create_graph{
    has json_file:list =[];
    can go_to_day with `root entry{
        for item in self.json_file{
            
        }

    }




}

with entry{
    json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
    root spawn create_graph(json_file=json_file["report"][0]);

}




