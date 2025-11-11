view: airport_remarks {
  sql_table_name: flightstats.airport_remarks ;;

  dimension: airport_remark_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.airport_remark_id ;;
  }

  dimension: site_number {
    type: string
    sql: ${TABLE}.site_number ;;
  }

  dimension: element_name {
    type: string
    sql: ${TABLE}.element_name ;;
  }

  dimension: remark {
    type: string
    sql: ${TABLE}.remark ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      airport_remark_id,
      site_number,
      element_name,
      remark
    ]
  }
}