view: states {
  sql_table_name: flightstats.states ;;

  dimension: state_code {
    type: string
    primary_key: yes
    sql: ${TABLE}.state_code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      state_code,
      name
    ]
  }
}