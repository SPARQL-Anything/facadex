%-- includes relates a resource with its datasources

fof(includes_resource_data_source,axiom,( ! [R,DS] : ( ( includes(R,DS) ) => resource(R) & datasource(DS) ) )). 

%-- a resource must include at least a datasource
fof(resource_must_include_datasource,axiom,(  ! [R] : ? [DS] : (  resource(R) => includes(R, DS) ) )). 

%-- a datasoruce must be included into a resource at least
fof(data_source_must_be_included,axiom,(  ! [DS] : ? [R] : (  datasource(DS) => includes(R, DS) ) )). 
 
 %-- a datasoruce must be included into a single data source
fof(rep_includes_ds, axiom, ![DS] : includes(get_resource(DS), DS)).
 
fof(single_resource_per_datasource,axiom,( ! [DS,R] : (  (includes(R,DS)  ) => (R = get_resource(DS)) ) )). 
     
 %-- the predicate hasslot connects a container to its slots
 fof(has_slot_container_slot, axiom, ( ! [C,S] : (haslot(C,S) => (container(C) & slot(S) ) ) ) ).
 
 %-- hasvalue connects a slot and a value
 fof(has_value_slot_value, axiom, ( ! [S,V] : (hasvalue(S,V) => (slot(S) & value(V) ) ) ) ).
 
 %-- hascontainer connects a slot with its container
 fof(has_container_slot_container, axiom, (![S,C] : (hascontainer(S,C) => (slot(S) & container(C))))).
 
 %-- numberslot specialises slot
 fof(number_slot, axiom, (![S]:numberslot(S)=>slot(S))) .
 
 %-- stringslot specialises slot
 fof(string_slot, axiom, (![S]:stringslot(S)=>slot(S))) .
 
 %-- stringslot and numberslot do not have common individuals
 fof(string_number_slot, axiom, (~(![S]: numberslot(S) & stringslot(S)))) .
     
%-- completeness of slots
fof(completeness_slots, axiom, (![S]: slot(S) => numberslot(S)|stringslot(S))) .

%-- includescontainer connects a datasource to its containers
fof(includes_container_def, axiom, (![DS,C] : includescontainer(DS,C)=> datasource(DS) & container(C))) .

%-- all the containers are included into a datasource
fof(containers_included, axiom, (![C]:?[DS]:container(C)=>includescontainer(DS,C))) .

%-- unique data source for each container
fof(unique_data_source_for_container_function, axiom, ![C] : includescontainer(get_datasource(C), C) ) .
fof(unique_data_source_for_container, axiom, ![C, DS]: includescontainer(DS,C) => DS = get_datasource(DS) ) .

%-- all the values must occur into a hasvalue
fof(value_hasvalue, axiom, ![V]:?[S]:value(V)=>hasvalue(S,V)) .

%-- all the slots must occur into a haslot
fof(slot_hasslot, axiom, ![S]:?[C]:slot(V)=>hasslot(C,S)) .

%-- unique container for each slot
fof(unique_container_for_slot_function, axiom, ![S] : hasslot(get_container(S), S )) .
fof(unique_container_for_slot, axiom, ![C, S]: hasslot(C, S) => C=get_container(S)) .

%-- every slot contains either a value or a container
fof(every_slot_contains_value_or_container, axiom, ![S]:?[X]:slot(s)=>hascontainer(S,X)|hasvalue(S,X)) .
fof(every_slot_contains_value_or_container_not_both, axiom, ~?[S,X]: hascontainer(S,X) & hasvalue(S,X)) .