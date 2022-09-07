view: xss_test {
  sql_table_name: demo_db.xss_test ;;

  dimension: xss_field {
    type: string
    sql: ${TABLE}.xss_field ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
