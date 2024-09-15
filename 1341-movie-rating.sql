(select name as results
from
    (select MovieRating.user_id, Users.name, count(rating) as rating_count
    from MovieRating left join Users on MovieRating.user_id = Users.user_id
    group by MovieRating.user_id, Users.name)
order by rating_count desc, name
limit 1)

UNION ALL

(select title as results
from
    (select MovieRating.movie_id, Movies.title, avg(rating) as average_rating
    from MovieRating left join Movies on MovieRating.movie_id = Movies.movie_id
    where to_char(created_at, 'YYYY-MM') = '2020-02'
    group by MovieRating.movie_id, Movies.title)
order by average_rating desc, title
limit 1)