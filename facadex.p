%-- includes relates a resource with its datasources

fof(includes_resource_data_source,axiom,( 
    ! [R,DS] : 
      ( ( includes(R,DS) ) 
     => resource(R) & datasource(DS) ) )). 

%-- a resource must include at least a datasource
fof(resource_must_include_datasource,axiom,( 
    ! [R] : ? [DS] : 
      (  resource(R) 
     => includes(R, DS) ) )). 

%-- a datasoruce must be included into a resource at least
fof(data_source_must_be_included,axiom,( 
    ! [DS] : ? [R] : 
      (  datasource(DS) 
     => includes(R, DS) ) )). 
 
 %-- a datasoruce must be included into a single data source
 fof(rep_includes_ds, axiom,
    ![DS] : includes(get_resource(DS), DS)
).
 
fof(single_resource_per_datasource,axiom,( 
    ! [DS,R] : 
      (  (includes(R,DS)  )
     => (R = get_resource(DS)) ) )). 
     
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
     

