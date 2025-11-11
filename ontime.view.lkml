view: ontime {
  sql_table_name: flightstats.ontime ;;

  dimension: id2 {
    primary_key: yes
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension_group: dep {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }

  dimension_group: arr {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.arr_time ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: is_delayed {
    type: yesno
    sql: ${arr_delay} > 0 ;;
  }

  dimension: is_cancelled {
    type: yesno
    sql: ${cancelled} = 'Yes' ;;
  }

  dimension: is_diverted {
    type: yesno
    sql: ${diverted} = 'Yes' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_dep_delay {
    type: average
    sql: ${dep_delay} ;;
    value_format_name: decimal_2
  }

  measure: average_arr_delay {
    type: average
    sql: ${arr_delay} ;;
    value_format_name: decimal_2
  }

  measure: average_flight_time {
    type: average
    sql: ${flight_time} ;;
    value_format_name: decimal_2
  }

  measure: total_distance {
    type: sum
    sql: ${distance} ;;
  }

  measure: average_distance {
    type: average
    sql: ${distance} ;;
    value_format_name: decimal_2
  }

  measure: count_delayed {
    type: count
    filters: [is_delayed: "yes"]
  }

  measure: count_cancelled {
    type: count
    filters: [is_cancelled: "yes"]
  }

  measure: percent_delayed {
    type: number
    sql: 100.0 * ${count_delayed} / NULLIF(${count}, 0) ;;
    value_format_name: percent_2
  }

  measure: percent_cancelled {
    type: number
    sql: 100.0 * ${count_cancelled} / NULLIF(${count}, 0) ;;
    value_format_name: percent_2
  }

  set: detail {
    fields: [
      id2,
      carrier,
      origin,
      destination,
      flight_num,
      dep_time,
      arr_time,
      dep_delay,
      arr_delay
    ]
  }
}
