view: imgsrc1onerroralert2 {
  sql_table_name: demo_db.<img/src='1'onerror=alert(2)> ;;

  dimension: div_stylebackground {
    type: string
    sql: ${TABLE}.`<div style="background->` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
