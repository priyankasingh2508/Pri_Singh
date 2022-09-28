connection: "google_playstore"

view: Sales {
  derived_table: {
    sql:select "1" as transaction_id,  date("2020-06-06") as date,  "6" as product_id,  "65" as salesperson_id,  "17" as customer_id,  "6" as office_id,  5 as hours,  9740 as sales,  "Florida" as transaction_state, union all
        select "2" as transaction_id,  date("2021-07-30") as date,  "2" as product_id,  "30" as salesperson_id,  "8" as customer_id,  "4" as office_id,  62 as hours,  98146 as sales,  "Iowa" as transaction_state, union all
        select "3" as transaction_id,  date("2021-01-05") as date,  "5" as product_id,  "15" as salesperson_id,  "5" as customer_id,  "3" as office_id,  3 as hours,  4899 as sales,  "New York" as transaction_state, union all
        select "4" as transaction_id,  date("2020-08-19") as date,  "8" as product_id,  "2" as salesperson_id,  "19" as customer_id,  "2" as office_id,  5 as hours,  6625 as sales,  "Utah" as transaction_state, union all
        select "5" as transaction_id,  date("2020-02-27") as date,  "8" as product_id,  "48" as salesperson_id,  "18" as customer_id,  "10" as office_id,  3 as hours,  3975 as sales,  "Alabama" as transaction_state, union all
        select "6" as transaction_id,  date("2021-06-24") as date,  "3" as product_id,  "20" as salesperson_id,  "1" as customer_id,  "3" as office_id,  19 as hours,  36176 as sales,  "Missouri" as transaction_state, union all
        select "7" as transaction_id,  date("2021-10-23") as date,  "5" as product_id,  "13" as salesperson_id,  "3" as customer_id,  "3" as office_id,  53 as hours,  86549 as sales,  "New York" as transaction_state, union all
        select "8" as transaction_id,  date("2020-01-21") as date,  "5" as product_id,  "63" as salesperson_id,  "16" as customer_id,  "1" as office_id,  15 as hours,  24495 as sales,  "California" as transaction_state, union all
        select "9" as transaction_id,  date("2021-09-18") as date,  "11" as product_id,  "73" as salesperson_id,  "17" as customer_id,  "1" as office_id,  52 as hours,  63284 as sales,  "New York" as transaction_state, union all
        select "10" as transaction_id,  date("2020-10-16") as date,  "11" as product_id,  "99" as salesperson_id,  "1" as customer_id,  "9" as office_id,  95 as hours,  115615 as sales,  "California" as transaction_state;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: salesperson_id {
    type: number
    sql: ${TABLE}.salesperson_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: transaction_state {
    type: string
    sql: ${TABLE}.transaction_state ;;
  }

  dimension: is_expensive {
    type: yesno
    sql: ${TABLE}.Sales>5000 ;;
  }

  dimension: sales_group {
    type: bin
    style: interval
    bins: [0,50000, 100000,150000,200000,250000]
    sql: ${TABLE}.Sales ;;
  }
  measure: Sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }
}

explore: Sales {

}