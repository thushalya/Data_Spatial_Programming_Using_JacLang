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

# can gen_edge(edge_info: dict) -> edge | None {
#     return_edge = None;
#     print(edge_info);
#     if edge_info["name"] == "parent" {
#         return_edge = parent(j_id=edge_info["jid"]);
#     } else {
#         print("edge type not supported");
#     }
#     return return_edge;
# }


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

edge parent{
    has jid:string;
}


"""Walker def"""
walker traverse_graph{
    can go_to_day with `root entry{

    }
    can go_to_workette with day entry{


    }
    can end with workette entry{

    }
}

walker create_graph{
    has json_file:list =[];
    can go_to_day with `root entry{
        # print(self.json_file);
        x=True;
        # for item in self.json_file{
            # jid=item[1]["jid"];
            # if (x==True){
            #     here ++> gen_node(item[0]);
            #     x=False;
            # }
            list1 = self.json_file[0];
            # print(list1[0]);
            first_node = gen_node(list1[0]);
            if (x==True){
                here ++> first_node;
                x=False;
            }
            
            last_node = gen_node(list1[2]);
            m = str("hello");
            first_node +:parent:jid=m:+> last_node;
            # first_node = gen_node(item[0]);
            # last_node = gen_node(item[2]);
            # f="f";
            # first_node+:parent:jid=f:+>last_node;
            
            # first_node = gen_node(item[0]);
            # last_node = gen_node(item[2]);
            # f="f";
            # first_node+:parent:jid=f:+>last_node;
            
            
        # }

    }




}

with entry{
    json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
    root spawn create_graph(json_file=json_file["report"][0]);
    print(dotgen(root));
}




