view: xss_test_2 {
  sql_table_name: demo_db.xss_test_2 ;;

  dimension: imgsrc1onerroralert1 {
    type: string
    sql: ${TABLE}.`<img/src="1"onerror=alert(1)>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
