# include: "/views/core_fields.view"
view: users {
 #required_access_grants: [can_see_pii]  ##--Nobody can access user view
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.users ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.##

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    # required_access_grants: [can_see_pii] ##--age is no longer exists in explore, but avg_age is still there
  }
  # measure: xyz {
  #   type: number
  #   sql: ${age}*${count} ;;
  # }
  # measure: final {
  #   type: number
  #   sql: ${xyz}/(${count_female_user}) ;;
 # }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }
  dimension: session_duration {
    label: "Session Duration"
    type: bin
    bins: [0, 6, 11, 16, 21, 26, 31]
    style: integer
    value_format: "0 \"mins\""
    sql: ${age} ;;
  }

  # measure: avg {
  #   type: number
  #   sql: ${total_age}/${count} ;;
  # }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: full_name {
    type: string
    sql: CONCAT(CONCAT(${first_name}, ' '), ${last_name}) ;;
    html: <font color="green">{{ value }}</font> ;;

  }
  dimension: fullname_redshift {
    type: string
    sql: ${first_name}||','||${last_name} ;;
  }
  dimension: leangth {
    type: number
    sql: len(${full_name}) ;;
  }
  dimension: age_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: classic
    sql: ${age} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    description: "When the order was created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      quarter_of_year
    ]
    sql: ${TABLE}.created_at ;;
  }


  ##-----OR-----

  # extends: [core_fields]

  dimension_group: days_since_created {
    type: duration
    intervals: [second,minute,hour,day,week,month,quarter,year]
    sql_start: ${created_date} ;;
    sql_end: current_date ;;
  }
  dimension: days_diff {
    type: number
    sql: datediff(day,${created_raw},current_date) ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;

    # link: {
    #   label: "user dashboard for {{ value }}"
    #   url: "/dashboards/1121?email={{ value }}"
    # }

    link:{
      label: "explore user info2"
      url:"/explore/ab_project/order_items?fields=orders.id,orders.status,orders.total_orders&sorts=orders.total_orders+desc&limit=50"
    }
    html:<button><a href= "user dashboard for {{ value }}">user dashboard for {{ value }}</a></button>;;

    # required_access_grants: [can_see_pii]
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    # group_label: "Location"
    case_sensitive: no
    type: string
    sql: ${TABLE}.state ;;
    # html: <a href="https://www.google.com/search?q={{value}}">{{value}} -ashoke</a> ;; #O/P syntax
  link: {
    label: "Srch in Google"
    url: "https://www.google.com/search?q={{value}}"
  }
    link: {
      label: "Search this page in Google"
      url: "https://www.google.com/search?q={{value}}"
    }
  }
  dimension: state_Test {
    # group_label: "Location"
    case_sensitive: no
    type: string
    sql: ${TABLE}.state ;;
    html: {% if value == "California" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align: center;"> {{rendered_value}} </p>
    {% elsif value == "Alabama" %}
    <p style="color: black; background-color: #B9C1BD; font-size: 25px; text-align: left;"> <b>Successful Orders: </b>You were {{ rendered_value }} the average </p>
    {% else %}
<div class="vis-single-value" style="line-height: 1; font-size: 200%; background-color: #f5f5f5; text-align: left; color: black;">
<p style="text-align: left;"><b>Successful Orders: </b>You were {{rendered_value}} the average</p>
</div>
    {% endif %};;
}
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    # group_label: "Location"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  dimension: date_formatted {
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%a, %B %d, %Y" }} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, orders.count]

  }
  dimension: Ceiling {
    type: number
    sql: ceiling(round(1.0*${users.age}/15, 2)) ;;
  }
  measure: Ceil {
    type: number
    sql: ceiling(round(1.0*${users.age}/15, 2)) ;;
  }
  # measure: sumOf {
  #   type: sum
  #   sql: ${count} ;;
  # }
  measure: count_female_user {
    type: count
    filters: [gender: "f"]
  }
  # measure: Now_time {
  #   type: date_time
  # sql: ${Now_time} ;;
  #   convert_tz: no
  # }
measure: percentage_female_user {
  type: number
 value_format_name: percent_1
 # value_format_name: currency_format
  sql: (1.0*${count_female_user}/NULLIF(${count},0)) ;;
  link: {label: "Explore Top 600 Results" url: "{{ count_female_user._link}}&limit=600" }
}}
