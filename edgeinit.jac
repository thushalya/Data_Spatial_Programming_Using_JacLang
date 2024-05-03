node day{
    has data:dict ={};

}

edge parent{
    has id:str="";
}

walker create_edge{
    has node_edge:str="";
    can create with `root entry{
        here +:parent:id="something":+>day({"id":"123"});
        self.node_edge= :e:[here-:parent:->];
        print(self.node_edge);
    }
}

with entry{
    root spawn create_edge();
}