view: airports {
  sql_table_name: flightstats.airports ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: site_number {
    type: string
    sql: ${TABLE}.site_number ;;
  }

  dimension: fac_type {
    label: "Facility Type"
    type: string
    sql: ${TABLE}.fac_type ;;
  }

  dimension: fac_use {
    label: "Facility Use"
    type: string
    sql: ${TABLE}.fac_use ;;
  }

  dimension: faa_region {
    type: string
    sql: ${TABLE}.faa_region ;;
  }

  dimension: faa_dist {
    label: "FAA District"
    type: string
    sql: ${TABLE}.faa_dist ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: own_type {
    label: "Owner Type"
    type: string
    sql: ${TABLE}.own_type ;;
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

  dimension: elevation {
    type: number
    sql: ${TABLE}.elevation ;;
  }

  dimension: aero_cht {
    label: "Aeronautical Chart"
    type: string
    sql: ${TABLE}.aero_cht ;;
  }

  dimension: cbd_dist {
    label: "CBD Distance"
    type: number
    sql: ${TABLE}.cbd_dist ;;
  }

  dimension: cbd_dir {
    label: "CBD Direction"
    type: string
    sql: ${TABLE}.cbd_dir ;;
  }

  dimension: act_date {
    label: "Activation Date"
    type: string
    sql: ${TABLE}.act_date ;;
  }

  dimension: cert {
    label: "Certificate Type"
    type: string
    sql: ${TABLE}.cert ;;
  }

  dimension: fed_agree {
    label: "Federal Agreement"
    type: string
    sql: ${TABLE}.fed_agree ;;
  }

  dimension: cust_intl {
    label: "Customs International"
    type: string
    sql: ${TABLE}.cust_intl ;;
  }

  dimension: c_ldg_rts {
    label: "Civil Landing Rights"
    type: string
    sql: ${TABLE}.c_ldg_rts ;;
  }

  dimension: joint_use {
    type: string
    sql: ${TABLE}.joint_use ;;
  }

  dimension: mil_rts {
    label: "Military Rights"
    type: string
    sql: ${TABLE}.mil_rts ;;
  }

  dimension: cntl_twr {
    label: "Control Tower"
    type: string
    sql: ${TABLE}.cntl_twr ;;
  }

  dimension: major {
    type: string
    sql: ${TABLE}.major ;;
  }

  dimension: is_major {
    type: yesno
    sql: ${major} = 'Y' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_elevation {
    type: average
    sql: ${elevation} ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [
      id,
      code,
      full_name,
      city,
      state,
      fac_type,
      elevation
    ]
  }
}
