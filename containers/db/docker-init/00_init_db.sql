create user civitai with password 'civitai';
create user pghero with password 'pghero';
create user retool with password 'retool';
create user mleng with password 'mleng';
create user hasura with password 'hasura';
create user "civitai-read" with password 'civitai-read';
create user postgres with password 'postgres';
create user "civitai-jobs" with password 'civitai-jobs';

CREATE EXTENSION citext;
CREATE EXTENSION pg_stat_statements;

CREATE schema pghero;