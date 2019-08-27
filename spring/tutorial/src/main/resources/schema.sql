DROP TABLE IF EXISTS meeting_room CASCADE;
DROP TABLE IF EXISTS reservable_room CASCADE;
DROP TABLE IF EXISTS reservation CASCADE;
DROP TABLE IF EXISTS usr CASCADE;

CREATE TABLE IF NOT EXISTS meeting_room (
    room_id   SERIAL NOT NULL,
    room_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (room_id)
);

CREATE TABLE IF NOT EXISTS reservable_room (
    reserved_date DATE NOT NULL,
    room_id       INT4 NOT NULL,
    PRIMARY KEY (reserved_date, room_id)
);

CREATE TABLE IF NOT EXISTS reservation (
    reservation_id SERIAL NOT NULL,
    end_time       TIME NOT NULL,
    start_time     TIME NOT NULL,
    reserved_date  DATE NOT NULL,
    room_id        INT4 NOT NULL,
    user_id        VARCHAR(255) NOT NULL,
    PRIMARY KEY (reservation_id)
);

CREATE TABLE IF NOT EXISTS usr (
    user_id    VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    role_name  VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

ALTER TABLE meeting_room DROP CONSTRAINT IF EXISTS FK_foo;
ALTER TABLE reservation DROP CONSTRAINT IF EXISTS FK_bar;
ALTER TABLE reservation DROP CONSTRAINT IF EXISTS FK_baz;

ALTER TABLE meeting_room ADD CONSTRAINT FK_foo FOREIGN KEY (room_id) REFERENCES meeting_room;
ALTER TABLE reservation ADD CONSTRAINT FK_bar FOREIGN KEY (reserved_date, room_id) REFERENCES reservable_room;
ALTER TABLE reservation ADD CONSTRAINT FK_baz FOREIGN KEY (user_id) REFERENCES usr;