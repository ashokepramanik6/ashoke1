view: xss_test_15 {
  sql_table_name: demo_db.xss_test_15 ;;

  dimension: div_stylebackgroundimage_urljavascriptalert1 {
    type: string
    sql: ${TABLE}.`<div style="background-image: url(javascript:alert(1))">`
      ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
