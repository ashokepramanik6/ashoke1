view: xss_test_6 {
  sql_table_name: demo_db.xss_test_6 ;;

  dimension: svganimate_onbeginalert1_attribute_namex_dur1s {
    type: string
    sql: ${TABLE}.`<svg><animate onbegin=alert(1) attributeName=x dur=1s>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
