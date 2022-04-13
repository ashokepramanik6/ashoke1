# If necessary, uncomment the line below to include explore_source.
# include: "ab_project.model.lkml"

view: product1 {
  derived_table: {
    explore_source: order_items {
      column: id { field: products.id }
      column: brand { field: products.brand }
      column: category { field: products.category }
    }
  }
  dimension: id {
    type: number
  }
  dimension: brand {}
  dimension: category {}
}
