view: xss_test_7 {
  sql_table_name: demo_db.xss_test_7 ;;

  dimension: script_srchttplol_comhello_jsscript {
    type: string
    sql: ${TABLE}.`<script src="http://lol.com/hello.js"></script>` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
