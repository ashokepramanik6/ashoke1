view: vvimgsrc1onerroralert2ll {
  sql_table_name: demo_db.VV<img/src='1'onerror=alert(2)>LL ;;

  dimension: div_stylebackground {
    type: string
    sql: ${TABLE}.`<div style="background->` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
