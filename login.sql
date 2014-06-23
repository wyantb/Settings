#Oracle's default DATE format is bad and should feel bad
alter session set nls_date_format = "YYYY-MM-DD HH24:MI:SS";
alter session set nls_timestamp_format = "YYYY-MM-DD HH24:MI:SS FF";
alter session set nls_timestamp_tz_format = "YYYY-MM-DD HH24:MI:SS TZH:TZM FF";

