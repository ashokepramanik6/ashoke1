view: pegdates {
  sql_table_name: demo_db.pegdates ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: mydate {
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
    sql: ${TABLE}.mydate ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
