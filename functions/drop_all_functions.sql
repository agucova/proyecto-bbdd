BEGIN;
    DROP FUNCTION IF EXISTS has_schedule_conflict;
    DROP FUNCTION IF EXISTS is_passport_valid;
    DROP FUNCTION IF EXISTS generate_reservation;
    -- old signature
    DROP FUNCTION IF EXISTS generate_ticket(integer, integer, integer);
    -- new signature
    DROP FUNCTION IF EXISTS generate_ticket(integer, integer, character varying);
END;