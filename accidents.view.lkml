view: accidents {
  sql_table_name: flightstats.accidents ;;
  
  # Primary Key
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  
  # Identifiers
  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }
  
  dimension: accident_number {
    type: string
    sql: ${TABLE}.accident_number ;;
  }
  
  # Dates
  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_date ;;
  }
  
  dimension_group: publication {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.publication_date ;;
  }
  
  # Investigation Details
  dimension: investigation_type {
    type: string
    sql: ${TABLE}.investigation_type ;;
  }
  
  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }
  
  # Location Information
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  
  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }
  
  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }
  
  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }
  
  dimension: airport_code {
    type: string
    sql: ${TABLE}.airport_code ;;
  }
  
  dimension: airport_name {
    type: string
    sql: ${TABLE}.airport_name ;;
  }
  
  # Severity and Damage
  dimension: injury_severity {
    type: string
    sql: ${TABLE}.injury_severity ;;
  }
  
  dimension: aircraft_damage {
    type: string
    sql: ${TABLE}.aircraft_damage ;;
  }
  
  # Aircraft Information
  dimension: aircraft_category {
    type: string
    sql: ${TABLE}.aircraft_category ;;
  }
  
  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }
  
  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }
  
  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }
  
  dimension: amateur_built {
    type: string
    sql: ${TABLE}.amateur_built ;;
  }
  
  dimension: number_of_engines {
    type: string
    sql: ${TABLE}.number_of_engines ;;
  }
  
  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }
  
  # Flight Details
  dimension: far_description {
    type: string
    sql: ${TABLE}.far_description ;;
  }
  
  dimension: schedule {
    type: string
    sql: ${TABLE}.schedule ;;
  }
  
  dimension: purpose_of_flight {
    type: string
    sql: ${TABLE}.purpose_of_flight ;;
  }
  
  dimension: air_carrier {
    type: string
    sql: ${TABLE}.air_carrier ;;
  }
  
  dimension: weather_condition {
    type: string
    sql: ${TABLE}.weather_condition ;;
  }
  
  dimension: broad_phase_of_flight {
    type: string
    sql: ${TABLE}.broad_phase_of_flight ;;
  }
  
  # Injury Counts (as dimensions for filtering)
  dimension: number_of_fatalities {
    type: string
    sql: ${TABLE}.number_of_fatalities ;;
  }
  
  dimension: number_of_serious_injuries {
    type: string
    sql: ${TABLE}.number_of_serious_injuries ;;
  }
  
  dimension: number_of_minor_injuries {
    type: string
    sql: ${TABLE}.number_of_minor_injuries ;;
  }
  
  dimension: number_of_uninjured {
    type: string
    sql: ${TABLE}.number_of_uninjured ;;
  }
  
  # Measures
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  
  measure: total_fatalities {
    type: sum
    sql: CAST(${number_of_fatalities} AS INTEGER) ;;
  }
  
  measure: total_serious_injuries {
    type: sum
    sql: CAST(${number_of_serious_injuries} AS INTEGER) ;;
  }
  
  measure: total_minor_injuries {
    type: sum
    sql: CAST(${number_of_minor_injuries} AS INTEGER) ;;
  }
  
  measure: total_uninjured {
    type: sum
    sql: CAST(${number_of_uninjured} AS INTEGER) ;;
  }
  
  measure: total_casualties {
    type: number
    sql: ${total_fatalities} + ${total_serious_injuries} + ${total_minor_injuries} ;;
  }
  
  # Drill Fields
  set: detail {
    fields: [
      id,
      accident_number,
      event_date,
      location,
      injury_severity,
      aircraft_damage,
      make,
      model,
      airport_name
    ]
  }
}
