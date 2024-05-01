from __future__ import annotations
from jaclang.plugin.feature import JacFeature as _Jac
from jaclang.plugin.builtin import *
from dataclasses import dataclass as __jac_dataclass__
import json

def gen_node(node_info: dict) -> day | workette | None:
    return_node: day | workette | None = None
    if node_info['name'] == 'day':
        return_node = day(node_info['context'])
    elif node_info['name'] == 'workette':
        return_node = workette(node_info['context'])
    else:
        print('node type not supported')
    return return_node

def gen_edge(edge_info: dict) -> edge | None:
    return_edge = None
    if edge_info['name'] == 'parent':
        return_edge = parent()
    else:
        print('edge type not supported')
    return return_edge

@_Jac.make_node(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class day:
    """
Nodes def

"""
    data: dict = _Jac.has_instance_default(gen_func=lambda: {})

@_Jac.make_node(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class workette:
    data: dict = _Jac.has_instance_default(gen_func=lambda: {})

@_Jac.make_edge(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class parent:
    """
Edges def

"""
    pass

@_Jac.make_walker(on_entry=[_Jac.DSFunc('go_to_day', _Jac.get_root()), _Jac.DSFunc('go_to_workette', day), _Jac.DSFunc('end', workette)], on_exit=[])
@__jac_dataclass__(eq=False)
class traverse_graph:
    """Walker def"""

    def go_to_day(self, _jac_here_: _Jac.get_root()) -> None:
        pass

    def go_to_workette(self, _jac_here_: day) -> None:
        pass

    def end(self, _jac_here_: workette) -> None:
        pass

@_Jac.make_walker(on_entry=[_Jac.DSFunc('go_to_day', _Jac.RootType)], on_exit=[])
@__jac_dataclass__(eq=False)
class create_graph:
    json_file: list = _Jac.has_instance_default(gen_func=lambda: [])

    def go_to_day(self, _jac_here_: _Jac.RootType) -> None:
        for item in self.json_file:
            print(item)
json_file = json.load(open('myca_buddy_testing_get_subgraph_today_0319.json', 'r'))
_Jac.spawn_call(_Jac.get_root(), create_graph(json_file=json_file['report'][0]))