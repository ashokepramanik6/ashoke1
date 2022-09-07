view: salary {
  sql_table_name: demo_db.Salary ;;

  dimension: dept_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DeptID ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}.Salary ;;
  }

  measure: count {
    type: count
    drill_fields: [dept.dept_id, dept.dept_name]
  }
}
