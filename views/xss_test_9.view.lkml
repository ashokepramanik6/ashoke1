view: xss_test_9 {
  sql_table_name: demo_db.xss_test_9 ;;

  dimension: div_stylebackgroundimage_urlhttpi_uadiv {
    type: string
    sql: ${TABLE}.`<div style="background-image: url('http://i.ua')"></div>`
      ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
