view: xss_test_1 {
  sql_table_name: demo_db.xss_test_1 ;;

  dimension: imgsrc1 {
    type: string
    sql: ${TABLE}.`<img/src=1>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
