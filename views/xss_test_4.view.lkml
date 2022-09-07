view: xss_test_4 {
  sql_table_name: demo_db.xss_test_4 ;;

  dimension: svglolsvg {
    type: string
    sql: ${TABLE}.`<svg>LOL</svg>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
