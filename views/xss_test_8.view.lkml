view: xss_test_8 {
  sql_table_name: demo_db.xss_test_8 ;;

  dimension: iframe_srcdochttpgoogle_com {
    type: string
    sql: ${TABLE}.`<iframe srcdoc='http://google.com'>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
