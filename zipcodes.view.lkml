view: zipcodes {
  sql_table_name: flightstats.zipcodes ;;

  dimension: zipcode_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.zipcode_id ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: state_fips {
    type: number
    sql: ${TABLE}.state_fips ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: allocation {
    type: number
    sql: ${TABLE}.allocation ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_population {
    type: sum
    sql: ${population} ;;
  }

  measure: average_population {
    type: average
    sql: ${population} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      zipcode_id,
      zipcode,
      name,
      state_code,
      population,
      latitude,
      longitude
    ]
  }
}