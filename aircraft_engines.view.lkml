view: aircraft_engines {
  sql_table_name: flightstats.aircraft_engines ;;

  dimension: aircraft_engine_code {
    type: string
    primary_key: yes
    sql: ${TABLE}.aircraft_engine_code ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: aircraft_engine_type_id {
    type: number
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: horsepower {
    type: number
    sql: ${TABLE}.horsepower ;;
  }

  dimension: thrust {
    type: number
    sql: ${TABLE}.thrust ;;
  }

  dimension: fuel_consumed {
    type: number
    sql: ${TABLE}.fuel_consumed ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_horsepower {
    type: sum
    sql: ${horsepower} ;;
  }

  measure: average_horsepower {
    type: average
    sql: ${horsepower} ;;
  }

  measure: total_thrust {
    type: sum
    sql: ${thrust} ;;
  }

  measure: average_thrust {
    type: average
    sql: ${thrust} ;;
  }

  measure: average_fuel_consumed {
    type: average
    sql: ${fuel_consumed} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      aircraft_engine_code,
      manufacturer,
      model,
      horsepower,
      thrust,
      fuel_consumed
    ]
  }
}