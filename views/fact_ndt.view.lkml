
  view: fact_ndt {
    derived_table: {
#--------------PDT-------------------------
      datagroup_trigger: users_datagroup
      # distribution_style: all

      ##--nice but not required,we can use sortkeys or indexes--
      # sortkeys: ["total_cost"]

      #---- same_things ,we can use distribution_style or distribution----
      distribution: "customer_id"
      indexes: ["customer_id"] #--doesn't do anything for redshift

#-------------------------------------------

      explore_source: order_items {
        column: customer_id { field: orders.user_id }
        column: status { field: orders.status }
        column: total_cost { field: inventory_items.total_cost }
        column: count { field: orders.count }
        column: total_revenue { field: order_items.total_revenue}
      # filters: {
      #   field: orders.created_date
      #   value: "365 days"
      # }
        derived_column: ranking {
          sql: RANK() OVER
          (ORDER BY total_revenue DESC);;
        }
      }
    }
    dimension: customer_id {
      type: number
      primary_key: yes
    }
    dimension: total_revenue {
      type: number
    }
    dimension: status {}
    dimension: total_cost {
      type: number
    }
    dimension: count {
      type: number
    }
    dimension: ranking {
      type: number
    }
  }
