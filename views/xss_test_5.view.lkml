view: xss_test_5 {
  sql_table_name: demo_db.xss_test_5 ;;

  dimension: svg_idx_onfocusalert1 {
    type: string
    sql: ${TABLE}.`<svg id=x onfocus=alert(1)>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
