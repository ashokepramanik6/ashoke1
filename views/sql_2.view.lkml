view: sql_2 {
  derived_table: {
    sql: SELECT
          "users"."city" AS "users.city",
          COUNT(DISTINCT orders.id ) AS "orders.count"
      FROM
          "public"."orders" AS "orders"
          LEFT JOIN "public"."users" AS "users" ON "orders"."user_id" = "users"."id"
      GROUP BY
          1
      ORDER BY
          2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}."users.city" ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}."orders.count" ;;
  }

  set: detail {
    fields: [users_city, orders_count]
  }
}
