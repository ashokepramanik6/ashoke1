view: dept {
  sql_table_name: demo_db.dept ;;
  drill_fields: [dept_id]

  dimension: dept_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DeptID ;;
  }

  dimension: dept_name {
    type: string
    sql: ${TABLE}.DeptName ;;
  }

  measure: count {
    type: count
    drill_fields: [dept_id, dept_name, salary.count]
  }
}
