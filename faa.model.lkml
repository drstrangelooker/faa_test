connection: "faa"

include: "/*.view.lkml"

datagroup: faa_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: faa_default_datagroup

explore: ontime {
  label: "Flight On-Time Performance"
  
  join: carriers {
    sql_on: ${ontime.carrier} = ${carriers.code} ;;
    relationship: many_to_one
  }
  
  join: origin {
    from: airports
    sql_on: ${ontime.origin} = ${origin.code} ;;
    relationship: many_to_one
  }
  
  join: destination {
    from: airports
    sql_on: ${ontime.destination} = ${destination.code} ;;
    relationship: many_to_one
  }
  
  join: aircraft {
    sql_on: ${ontime.tail_num} = ${aircraft.tail_num} ;;
    relationship: many_to_one
  }
}

explore: accidents {
  label: "Aircraft Accidents"
  
  join: airports {
    sql_on: ${accidents.airport_code} = ${airports.code} ;;
    relationship: many_to_one
  }
  
  join: carriers {
    sql_on: ${accidents.air_carrier} = ${carriers.code} ;;
    relationship: many_to_one
  }
}

explore: aircraft {
  label: "Aircraft Registry"
  
  join: airports {
    sql_on: ${aircraft.state} = ${airports.state} ;;
    relationship: many_to_one
  }
  
  join: aircraft_models {
    sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code} ;;
    relationship: many_to_one
  }
  
  join: aircraft_types {
    sql_on: ${aircraft_models.aircraft_type_id} = ${aircraft_types.aircraft_type_id} ;;
    relationship: many_to_one
  }
  
  join: aircraft_engine_types {
    sql_on: ${aircraft_models.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
}

explore: airports {
  label: "Airports"
  
  join: states {
    sql_on: ${airports.state} = ${states.state_code} ;;
    relationship: many_to_one
  }
  
  join: airport_remarks {
    sql_on: ${airports.site_number} = ${airport_remarks.site_number} ;;
    relationship: one_to_many
  }
}

explore: aircraft_models {
  label: "Aircraft Models"
  
  join: aircraft_types {
    sql_on: ${aircraft_models.aircraft_type_id} = ${aircraft_types.aircraft_type_id} ;;
    relationship: many_to_one
  }
  
  join: aircraft_engine_types {
    sql_on: ${aircraft_models.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
  
  join: aircraft_engines {
    sql_on: ${aircraft_models.aircraft_engine_type_id} = ${aircraft_engines.aircraft_engine_type_id} ;;
    relationship: one_to_many
  }
}

explore: aircraft_engines {
  label: "Aircraft Engines"
  
  join: aircraft_engine_types {
    sql_on: ${aircraft_engines.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
}

explore: exceptions {
  label: "Data Exceptions"
  
  join: carriers {
    sql_on: ${exceptions.carrier} = ${carriers.code} ;;
    relationship: many_to_one
  }
}

explore: states {
  label: "States"
  
  join: zipcodes {
    sql_on: ${states.state_code} = ${zipcodes.state_code} ;;
    relationship: one_to_many
  }
}

explore: zipcodes {
  label: "ZIP Codes"
  
  join: states {
    sql_on: ${zipcodes.state_code} = ${states.state_code} ;;
    relationship: many_to_one
  }
}