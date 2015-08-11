# Schema Information

## activities
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
creator_id  | integer   | not null, foreign key (references users)
title       | string    | not null
description | text      | not null
img_url     | string    | null
city_id     | integer   | not null, foreign key (references cities)
capacity    | integer   | not null

## cities

column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null, unique (composite with state)
state       | string    | not null, unique (composite with name)

## category_links
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
category_id | integer   | not null, foreign key (references categories)
activity_id | integer   | not null, foreign key (references activities)

## categories
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
label       | string    | not null, unique

## reviews
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
num_stars   | integer   | not null
description | text      | null
activity_id | integer   | not null, foreign key (references activities)

## booked_activities
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
customer_id | integer   | not null, foreign key (references users)
date        | datetime  | not null
activity_id | integer   | not null, foreign key (references activities)

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
