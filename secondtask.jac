import:py json;


##Load Json

## Recreate the graph

## Traverse the graph and printout it

##connect an edge
## delete a node



can gen_node(node_info:dict) -> day | workette | None{
    return_node: day | workette | None = None;
    if node_info["name"] == "day" {
        # return_node = day(jid=node_info["jid"],data = node_info["context"]);
        return_node = day(jid=node_info["jid"]);

    }elif node_info["name"] == "workette"{
        # return_node = workette(jid=node_info["jid"],data= node_info["context"]);
        return_node = workette(jid=node_info["jid"]);
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
    has jid: string="";
    # has data:dict ={};

}

node workette{
    has jid: string="";
    # has data:dict ={};
}

"""
Edges def

"""

edge parent{
    has jid:string="";
}


"""Walker def"""
walker traverse_graph{


    can go_to_day with `root entry{
        self.day_nodes =[-->];
        # print("day",self.day_nodes);
        visit self.day_nodes;

    }
    can go_to_workette with day entry{
        self.workette_nodes =[-->];
        # print("workette",self.workette_nodes);
        visit self.workette_nodes;
        
        # for workette_node in self.workette_nodes{
        #     # print(workette_node);
        #     visit workette_node;
        # }
    }
    can end with workette entry{
        
        if len([-->])>0{
            self.bottom_workette_nodes =[-->];
            # print("bottom",self.bottom_workette_nodes);
            visit self.bottom_workette_nodes;
        }
        # for workette_node in self.bottom_workette_nodes{
        #     print(workette_node);
        #     visit workette_node;
        # }

    }
}

walker create_graph{
    has json_file:list =[];
    has node_list:dict={};
    # has workette_node_list:dict={};
    can go_to_day with `root entry{
        # print(self.json_file);
        x=True;
        for item in self.json_file{
            # jid=item[1]["jid"];
            # if (x==True){
            #     here ++> gen_node(item[0]);
            #     x=False;
            # }
            # list1 = self.json_file[0];
            # list1 = item[0];
            # print(list1[0]);
            
            ## Creating first node
            if(item[0]["jid"] not in self.node_list){
                first_node = gen_node(item[0]);
                self.node_list[first_node.jid]=first_node;
                if (x==True){
                    here ++> first_node;
                    x=False;
                }
                # print(item[0]["jid"]);
            }
            else{
                first_node = self.node_list[item[0]["jid"]];
            }


            # Creating last node
            if(item[2]["jid"] not in self.node_list){
                last_node = gen_node(item[2]);
                self.node_list[last_node.jid]=last_node;
            }
            else{
                last_node = self.node_list[item[2]["jid"]];
            }
            # print(first_node.jid,"  ",last_node.jid);

            #Taking the id of the edge
            edgeid=item[1]["jid"];
            
            first_node +:parent:jid=edgeid:+> last_node;
            # first_node = gen_node(item[0]);
            # last_node = gen_node(item[2]);
            # f="f";
            # first_node+:parent:jid=f:+>last_node;
            
            # first_node = gen_node(item[0]);
            # last_node = gen_node(item[2]);
            # f="f";
            # first_node+:parent:jid=f:+>last_node;
            
            
        }

    }




}


# with entry{
#     json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
#     root spawn create_graph(json_file=json_file["report"][0]);
#     graph = root spawn traverse_graph();
#     # print(graph.workette_nodes);
#     # print(dotgen(root));
# }




