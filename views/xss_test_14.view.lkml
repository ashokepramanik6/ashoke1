view: xss_test_14 {
  sql_table_name: demo_db.xss_test_14 ;;

  dimension: backgroundimage_urldatatexthtmlimgonerroralert2 {
    type: string
    sql: ${TABLE}.`background-image: url(data:text/html,<img/onerror=alert(2)>)">`
      ;;
  }

  dimension: div_style {
    type: string
    sql: ${TABLE}.`<div style="` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
