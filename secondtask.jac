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

    }
    can go_to_workette with day entry{


    }
    can end with workette entry{

    }
}

walker create_graph{
    has json_file:list =[];
    has day_node_list:dict={};
    has workette_node_list:dict={};
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
            if(item[0]["jid"] not in self.day_node_list){
                first_node = gen_node(item[0]);
                self.day_node_list[first_node.jid]=first_node;
                if (x==True){
                    here ++> first_node;
                    x=False;
                }
                # print(item[0]["jid"]);
            }
            else{
                first_node = self.day_node_list[item[0]["jid"]];
            }


            # Creating last node
            if(item[2]["jid"] not in self.workette_node_list){
                last_node = gen_node(item[2]);
                self.workette_node_list[last_node.jid]=last_node;
            }
            else{
                last_node = self.workette_node_list[item[2]["jid"]];
            }

            m = str("hello");
            print(first_node.jid,"  ",last_node.jid);


            
            first_node +:parent:jid=m:+> last_node;
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

with entry{
    json_file = json.load(open(f"myca_buddy_testing_get_subgraph_today_0319.json", "r"));
    root spawn create_graph(json_file=json_file["report"][0]);
    # print(dotgen(root));
}




