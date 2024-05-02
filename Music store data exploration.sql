 --- 1)To find the senior most employee
 
SELECT * FROM music_store.employee 
ORDER BY levels desc
LIMIT 1;

-- Adams Andrew is the senior most employee


--- 2)To find which country has the most invoices
SELECT COUNT(*) as c,billing_country FROM music_store.invoice
GROUP BY billing_country
ORDER BY C DESC;

--- USA has the most number of invoices

--- 3)To find the top 3 values of invoices
SELECT * FROM music_store.invoice
ORDER BY total desc 
LIMIT 3;

--- Top value are 23.759, 19.8, 19.8 rewspectively

--- 4) City with highest sum of total invoices
SELECT * FROM music_store.invoice;
SELECT SUM(total) as sum , billing_city FROM music_store.invoice
group by billing_city
ORDER BY 1 DESC 
LIMIT 1 ;

--- Prague has the best customers 

--- 5) Finding the best customer 
SELECT * FROM music_store.customer;
SELECT  music_store.customer.customer_id,music_store.customer.firstname,music_store.customer.lastname,
SUM( music_store.invoice.total) as total from  music_store.customer
 JOIN 
 music_store.invoice ON music_store.customer.customer_id=music_store.invoice.customer_id
 group by music_store.customer.customer_id,music_store.customer.firstname,music_store.customer.lastname
 order by total desc
 limit 1;
 
 
--- Frantiek Wichterlov is the best customer

--- 6) Finding name,emailid and genre of all Rock Music listeners
SELECT firstname,lastname,email FROM music_store.customer 
JOIN music_store.invoice 
ON music_store.customer.customer_id=music_store.invoice.customer_id
JOIN  music_store.invoice_line ON music_store.invoice.invoice_id=music_store.invoice_line.invoice_id
WHERE track_id IN 
(
SELECT  track_id FROM music_store.track 
JOIN music_store.genre ON music_store.track.genre_id=music_store.genre.genre_id
WHERE music_store.genre.name LIKE 'Rock'
)
ORDER BY email;

--- 7) Finding total track count of top 10 rock bands and the artist name 

SELECT music_store.artist.artist_id,music_store.artist.name,COUNT(music_store.artist.artist_id) as total_songs FROM music_store.track
join music_store.album2 ON music_store.album2.album_id=music_store.track.album_id
join music_store.artist ON music_store.artist.artist_id=music_store.album2.artist_id
join  music_store.genre on music_store.genre.genre_id=music_store.track.genre_id
where  music_store.genre.name LIKE 'Rock'
GROUP BY music_store.artist.artist_id,music_store.artist.name
order by total_songs desc
limit 10;



