view: fatal_error_user_derived_base {
  sql_table_name: demo_db.FATAL_ERROR_user_derived_base ;;

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
