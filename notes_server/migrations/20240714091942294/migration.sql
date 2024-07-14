BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "data" bigint NOT NULL,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR notes
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('notes', '20240714091942294', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240714091942294', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
