view: exceptions {
  sql_table_name: flightstats.exceptions ;;

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: bad_tail_num {
    type: string
    sql: ${TABLE}.bad_tail_num ;;
  }

  dimension: good_tail_num {
    type: string
    sql: ${TABLE}.good_tail_num ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension_group: first_seen {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_seen ;;
  }

  dimension_group: last_seen {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_seen ;;
  }

  dimension: days_between_first_last {
    type: number
    sql: DATEDIFF(${last_seen_raw}, ${first_seen_raw}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      carrier,
      bad_tail_num,
      good_tail_num,
      owner_name,
      first_seen_date,
      last_seen_date
    ]
  }
}