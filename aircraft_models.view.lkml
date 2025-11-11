view: aircraft_models {
  sql_table_name: flightstats.aircraft_models ;;

  dimension: aircraft_model_code {
    type: string
    primary_key: yes
    sql: ${TABLE}.aircraft_model_code ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: aircraft_type_id {
    type: number
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension: aircraft_engine_type_id {
    type: number
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: aircraft_category_id {
    type: number
    sql: ${TABLE}.aircraft_category_id ;;
  }

  dimension: amateur {
    type: yesno
    sql: ${TABLE}.amateur ;;
  }

  dimension: engines {
    type: number
    sql: ${TABLE}.engines ;;
  }

  dimension: seats {
    type: number
    sql: ${TABLE}.seats ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_seats {
    type: average
    sql: ${seats} ;;
  }

  measure: average_weight {
    type: average
    sql: ${weight} ;;
  }

  measure: average_speed {
    type: average
    sql: ${speed} ;;
  }

  measure: total_seats {
    type: sum
    sql: ${seats} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      aircraft_model_code,
      manufacturer,
      model,
      engines,
      seats,
      weight,
      speed
    ]
  }
}