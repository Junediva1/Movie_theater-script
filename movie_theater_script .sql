-- Primary Key be empty of duplicated 
create table CUSTOMER_MOVIE(
     customer_id SERIAL primary key,
     first_name VARCHAR(255),
     last_name VARCHAR(255),
     phone_number VARCHAR(11)
);

-- MOVIE TABLE
create table MOVIE_MOVIE(
     movie_id SERIAL primary key,
     movie_title VARCHAR(150),
     show_time TIME,
     ratings VARCHAR(10)
);

-- INVENTORY TABLE
create table INVENTORY_MOVIE(
	 upc SERIAL primary key,
	 product_amount INTEGER
);

-- CONSESSION TABLE
create table CONSESSION_MOVIE(
	 consession_id SERIAL primary key,
	 order_date DATE default CURRENT_DATE,
	 sub_total NUMERIC(8,2),
	 total_cost NUMERIC(10,2)
);


-- PRODUCT TABLE
create table PRODUCT_MOVIE(
	 item_id SERIAL primary key,
	 price NUMERIC(5,2),
	 product_name VARCHAR(100),
	 upc INTEGER not null,  
	 foreign KEY(upc) references inventory_movie(upc)
);

-- MOVIE TICKETS
create table MOVIETICK_MOVIE(
	 ticket_id SERIAL primary key,
	 seat_assignment VARCHAR(10),
	 ticket_cost NUMERIC(5,2),
	 movie_id INTEGER not null,
	 customer_id INTEGER not null,
	 foreign key(movie_id) references movie_movie(movie_id),
	 foreign key(customer_id) references customer_movie(customer_id)
);
