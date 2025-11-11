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
}

explore: airports {
  label: "Airports"
}
