view: persons {
  sql_table_name: demo_db.Persons ;;

  dimension: emp_id {
    type: number
    sql: ${TABLE}.EmpID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
