view: sql_2 {
  derived_table: {
    sql: SELECT
          "users"."city" AS "users.city",
          "users"."id" AS "users.id",
          COUNT(DISTINCT users.id ) AS "users.count"
      FROM
          "public"."orders" AS "orders"
          LEFT JOIN "public"."users" AS "users" ON "orders"."user_id" = "users"."id"
      GROUP BY
          1,
          2
      ORDER BY
          3 DESC
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

  dimension: users_id {
    type: number
    sql: ${TABLE}."users.id" ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}."users.count" ;;
  }

  set: detail {
    fields: [users_city, users_id, users_count]
  }
}
