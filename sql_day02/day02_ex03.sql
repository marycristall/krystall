WITH dates AS (
    SELECT missing_date::date
    FROM generate_series('2022-01-01'::date, '2022-01-10', '1 day') AS missing_date)
    SELECT missing_date
    FROM dates
        LEFT JOIN (
            SELECT *
            FROM person_visits pv
            WHERE (
                    pv.person_id = '1'
                    OR pv.person_id = '2'
                )
                AND (
                    pv.visit_date BETWEEN '2022-01-01' AND '2022-01-10'
                )
        ) d ON (missing_date = d.visit_date)
    WHERE visit_date is null
    ORDER BY missing_date