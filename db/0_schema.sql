CREATE DATABASE LabLibrary;

CREATE TABLE LabLibrary.book
(
    id              INTEGER      NOT NULL PRIMARY KEY,
    name            VARCHAR(128) NOT NULL,
    author          VARCHAR(128) NOT NULL,
    thumbnail       VARCHAR(128),
    page_num        INTEGER,
    publisher       VARCHAR(64),
    publish_date    DATE,
    collection_date DATE         NOT NULL,
    isbn13          VARCHAR(64)
);

CREATE TABLE LabLibrary.user
(
    id           INTEGER      NOT NULL PRIMARY KEY,
    name         VARCHAR(128) NOT NULL,
    password     VARCHAR(128) NOT NULL,
    mail_address VARCHAR(128) NOT NULL,
    thumbnail    VARCHAR(128),
    user_rank    INTEGER      NOT NULL
);

CREATE TABLE LabLibrary.comment
(
    id      INTEGER       NOT NULL PRIMARY KEY,
    book_id INTEGER       NOT NULL,
    user_id INTEGER       NOT NULL,
    comment VARCHAR(4096) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES LabLibrary.book (id),
    FOREIGN KEY (user_id) REFERENCES LabLibrary.user (id)
);

CREATE TABLE LabLibrary.event
(
    id      INTEGER NOT NULL PRIMARY KEY,
    book_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    date    DATE    NOT NULL,
    type    INTEGER NOT NULL,
    FOREIGN KEY (book_id) REFERENCES LabLibrary.book (id),
    FOREIGN KEY (user_id) REFERENCES LabLibrary.user (id)
)