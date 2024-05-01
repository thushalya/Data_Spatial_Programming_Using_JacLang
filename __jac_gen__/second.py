from __future__ import annotations
from jaclang.plugin.feature import JacFeature as _Jac
from jaclang.plugin.builtin import *
from dataclasses import dataclass as __jac_dataclass__

@_Jac.make_node(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class day:
    value: str

@_Jac.make_node(on_entry=[], on_exit=[])
@__jac_dataclass__(eq=False)
class item:
    value: str

@_Jac.make_walker(on_entry=[_Jac.DSFunc('create_day', _Jac.RootType), _Jac.DSFunc('create_item', day), _Jac.DSFunc('end', item)], on_exit=[])
@__jac_dataclass__(eq=False)
class create:
    date: str
    items: list = _Jac.has_instance_default(gen_func=lambda: [])

    def create_day(self, _jac_here_: _Jac.RootType) -> None:
        n = _Jac.connect(left=_jac_here_, right=day(value=self.date), edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
        if _Jac.visit_node(self, n):
            pass

    def create_item(self, _jac_here_: day) -> None:
        for list_item in self.items:
            n = _Jac.connect(left=_jac_here_, right=item(value=list_item), edge_spec=_Jac.build_edge(is_undirected=False, conn_type=None, conn_assign=None))
            if _Jac.visit_node(self, n):
                pass

    def end(self, _jac_here_: item) -> None:
        print(_jac_here_.value)
_Jac.spawn_call(_Jac.get_root(), create(date='2024-04-30', items=['something', 'laundry']))