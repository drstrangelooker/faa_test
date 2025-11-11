view: aircraft {
  sql_table_name: flightstats.aircraft ;;

  dimension: tail_num {
    primary_key: yes
    label: "Tail Number"
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: aircraft_serial {
    type: string
    sql: ${TABLE}.aircraft_serial ;;
  }

  dimension: aircraft_model_code {
    type: string
    sql: ${TABLE}.aircraft_model_code ;;
  }

  dimension: aircraft_engine_code {
    type: string
    sql: ${TABLE}.aircraft_engine_code ;;
  }

  dimension_group: year_built {
    type: time
    timeframes: [year]
    sql: ${TABLE}.year_built ;;
  }

  dimension: aircraft_type_id {
    type: number
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension: aircraft_engine_type_id {
    type: number
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: registrant_type_id {
    type: number
    sql: ${TABLE}.registrant_type_id ;;
  }

  dimension: name {
    label: "Owner Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: certification {
    type: string
    sql: ${TABLE}.certification ;;
  }

  dimension: status_code {
    type: string
    sql: ${TABLE}.status_code ;;
  }

  dimension: mode_s_code {
    type: string
    sql: ${TABLE}.mode_s_code ;;
  }

  dimension: fract_owner {
    label: "Fractional Owner"
    type: string
    sql: ${TABLE}.fract_owner ;;
  }

  dimension_group: last_action {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.last_action_date ;;
  }

  dimension_group: cert_issue {
    label: "Certificate Issue"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.cert_issue_date ;;
  }

  dimension_group: air_worth {
    label: "Airworthiness"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.air_worth_date ;;
  }

  dimension: aircraft_age {
    type: number
    sql: YEAR(CURRENT_DATE) - ${year_built_year} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_aircraft_age {
    type: average
    sql: ${aircraft_age} ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [
      tail_num,
      aircraft_model_code,
      year_built_year,
      name,
      city,
      state
    ]
  }
}
