USE `flydb`;

create trigger book_seats before insert on bookings for each row
SET NEW.seat = (SELECT seats FROM flight WHERE flight.id=NEW.id);

create trigger decr_seats after insert on bookings for each row
UPDATE flight SET seats = seats - 1 WHERE id=NEW.id; 

create trigger incr_seats after delete on
bookings for each row
UPDATE flight SET seats = seats + 1 WHERE id=OLD.id;