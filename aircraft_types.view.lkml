view: aircraft_types {
  sql_table_name: flightstats.aircraft_types ;;

  dimension: aircraft_type_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      aircraft_type_id,
      description
    ]
  }
}