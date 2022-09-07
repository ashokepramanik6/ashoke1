view: incremental_pdts_test {
  sql_table_name: demo_db.incremental_pdts_test ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: val {
    type: string
    sql: ${TABLE}.val ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
