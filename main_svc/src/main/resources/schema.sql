drop table if exists users cascade;
drop table if exists categories cascade;
drop table if exists locations cascade;
drop table if exists events cascade;
drop table if exists compilations cascade;
drop table if exists compilations_events cascade;
drop table if exists requests cascade;

create table if not exists USERS
(
    ID    bigint generated by default as identity not null,
    NAME  varchar(255)                            not null,
    EMAIL varchar(255)                            not null unique,
    constraint PK_USER
        primary key (ID)
);


create table if not exists categories
(
    ID   bigint generated by default as identity not null,
    NAME varchar(255)                            not null,
    constraint PK_CATEGORY
        primary key (ID)
);

create table if not exists locations
(
    ID  bigint generated by default as identity not null,
    lat float                                   not null,
    lon float                                   not null,
    constraint PK_LOCATION
        primary key (ID)
);



create table if not exists events
(
    ID                 bigint generated by default as identity not null,
    annotation         varchar,
    category_id        bigint,
    confirmed_Requests bigint,
    description        text,
    event_Date         timestamp without time zone,
    created_On         timestamp without time zone,
    initiator_id       bigint,
    location_id        bigint,
    paid               boolean,
    participant_Limit  bigint,
    published_On       timestamp without time zone,
    request_Moderation boolean,
    state              varchar,
    title              varchar,
    views              bigint,
    constraint PK_EVENT
        primary key (ID),
    constraint EVENTS_CATEGORIES_ID_FK
        foreign key (category_id)
            references categories (ID) on delete cascade,
    constraint EVENTS_LOCATIONS_ID_FK
        foreign key (location_id)
            references locations (ID) on delete cascade,
    constraint EVENTS_USERS_ID_FK
        foreign key (initiator_id)
            references USERS (ID) on delete cascade
);


create table if not exists Requests
(
    ID        bigint generated by default as identity not null,
    created   timestamp without time zone,
    event     bigint                                  not null,
    requester bigint                                  not null,
    status    varchar                                 not null,
    constraint PK_REQUEST
        primary key (ID),
    constraint REQUESTS_EVENTS_ID_FK
        foreign key (event)
            references EVENTS (ID) on delete cascade,
    constraint REQUESTS_USERS_ID_FK
        foreign key (requester)
            references USERS (ID) on delete cascade
);


CREATE TABLE IF NOT EXISTS compilations
(
    id     BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    pinned BOOLEAN,
    title  VARCHAR,
    CONSTRAINT uq_compilation_title UNIQUE (title)
);

CREATE TABLE IF NOT EXISTS compilations_events
(
    event_id       BIGINT,
    compilation_id BIGINT,
    CONSTRAINT fk_to_compilations
        FOREIGN KEY (compilation_id) REFERENCES compilations (id),
    CONSTRAINT fk_to_events
        FOREIGN KEY (event_id) REFERENCES events (id)
);

