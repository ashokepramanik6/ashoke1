view: employees {
  sql_table_name: demo_db.Employees ;;

  dimension: emp_id {
    type: number
    sql: ${TABLE}.EmpID ;;
  }

  dimension: manager {
    type: number
    sql: ${TABLE}.Manager ;;
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
