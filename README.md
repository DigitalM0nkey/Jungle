# Jungle

A mini e-commerce application built with Rails 4.2
This project was part built and was used as an example of joining a team with an already existing codebase.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Screen Shots

### Products Page

![Products Page](config/images/productsPage.png)

### Products Admin Page

![Products Admin Page](config/images/productAdmin.png)

### Shopping Cart

![Shopping Cart](config/images/shoppingCart.png)

### Stripe Intergration

![Stripe Intergration](config/images/stripIntergration.png)
