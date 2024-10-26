{
  "$GMObject":"",
  "%Name":"obj_player",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_player",
  "overriddenProperties":[],
  "parent":{
    "name":"Objects",
    "path":"folders/Objects.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"downward_velocity","filters":[],"listItems":[],"multiselect":false,"name":"downward_velocity","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"num_remaining_flaps","filters":[],"listItems":[],"multiselect":false,"name":"num_remaining_flaps","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"flaps_per_jump","filters":[],"listItems":[],"multiselect":false,"name":"flaps_per_jump","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"3","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"has_released_spacebar_this_jump","filters":[],"listItems":[],"multiselect":false,"name":"has_released_spacebar_this_jump","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"True","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"jump_speed","filters":[],"listItems":[],"multiselect":false,"name":"jump_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"25","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"flap_jump_speed","filters":[],"listItems":[],"multiselect":false,"name":"flap_jump_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"20","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"base_gravity_while_falling","filters":[],"listItems":[],"multiselect":false,"name":"base_gravity_while_falling","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"8","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"base_gravity_while_rising","filters":[],"listItems":[],"multiselect":false,"name":"base_gravity_while_rising","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1.5","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"floatiness_while_finished_flapping","filters":[],"listItems":[],"multiselect":false,"name":"floatiness_while_finished_flapping","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"move_speed","filters":[],"listItems":[],"multiselect":false,"name":"move_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"15","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"max_fall_speed","filters":[],"listItems":[],"multiselect":false,"name":"max_fall_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"13","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_player_new",
    "path":"sprites/spr_player_new/spr_player_new.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}