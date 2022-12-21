-- Keep a log of any SQL queries you execute as you solve the mystery.

--ШУКАЮ ЗАЧІПКИ
SELECT description FROM crime_scene_reports WHERE day= 28 AND month = 7 AND year = 2021 AND street = "Humphrey Street";

SELECT name, transcript FROM interviews WHERE day= 28 AND month = 7 AND year = 2021 AND transcript LIKE "%bakery%";

SELECT minute, activity FROM bakery_security_logs WHERE day= 28 AND month = 7 AND year = 2021 AND hour = 10 AND (minute BETWEEN 15 AND 20);

--ШУКАЮ ЗЛОЧИНЦЯ
SELECT name FROM people JOIN phone_calls ON phone_calls.caller = people.phone_number WHERE year = 2021 AND month = 7 AND day= 28 AND (phone_calls.duration BETWEEN 30 AND 60)
INTERSECT
SELECT name FROM people JOIN bakery_security_logs ON bakery_security_logs.license_plate = people.license_plate WHERE day = 28 AND month = 7 AND year = 2021 AND hour = 10 AND (minute BETWEEN 15 AND 20);

SELECT name, phone_calls.duration FROM people JOIN phone_calls ON people.phone_number = phone_calls.caller WHERE year = 2021 AND month = 7 AND day= 28 AND (phone_calls.duration BETWEEN 30 AND 60);

SELECT name FROM people JOIN bank_accounts ON bank_accounts.person_id = people.id JOIN atm_transactions ON atm_transactions.account_number = bank_accounts.account_number WHERE atm_transactions.day = 28 AND atm_transactions.month = 7 AND atm_transactions.year = 2021 AND atm_transactions.atm_location = "Leggett Street";

--ШУКАЮ ПІДСОБНИКА
SELECT name FROM people JOIN phone_calls ON people.phone_number = phone_calls.receiver WHERE year = 2021 AND month = 7 AND day= 28 AND phone_calls.duration = 45;

--ШУКАЮ МІСТО, У ЯКЕ ВІДПРАВИВСЯ ЗЛОДІЙ
SELECT abbreviation, full_name FROM airports WHERE city = "Fiftyville";

SELECT hour, minute FROM flights WHERE day= 29 AND month = 7 AND year = 2021 ORDER BY hour ASC;

SELECT city FROM airports JOIN flights ON flights.destination_airport_id = airports.id WHERE day= 29 AND month = 7 AND year = 2021 AND hour = 8 AND minute = 20;

SELECT name FROM people JOIN passengers ON passengers.passport_number = people.passport_number JOIN flights ON flights.id = passengers.flight_id WHERE day= 29 AND month = 7 AND year = 2021 AND hour = 8 AND minute = 20;