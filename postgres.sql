CREATE TABLE public.clients (
    id bigint NOT NULL,
    user_id bigint,
    date_deactivated text,
    deactivated boolean,
    policy_id text,
    rate_id text,
    rate_type integer,
    custom_amount text,
    location_id bigint,
    agency_id bigint,
    is_client boolean,
    referrer_id text,
    conversion_date date,
    primary_care_manager_id text,
    secondary_care_manager_id text,
    custom_field_value_id text,
    last_carelog_date date,
    esignature_client_flag boolean,
    esignature_caregiver_flag boolean,
    care_management_rate_type integer,
    care_management_rate_id text,
    care_management_custom_amount text,
    marketer_id text,
    scheduler_id text,
    primary_manager_id text,
    secondary_manager_id text,
    deactivation_reason text,
    prospect_date_created timestamp without time zone,
    client_date_created timestamp without time zone,
    patient_updated timestamp without time zone,
    charge_tax boolean,
    invoice_duedate_terms text,
    in_facility boolean,
    auto_clock_in_status text,
    payer_contact_id bigint,
    created timestamp without time zone,
    updated timestamp without time zone,
    tax_jurisdiction text,
    deleted text,
    originator_id bigint,
    last_updated_by_id text,
    deleted_by_id text,
    qoc_consent_provided boolean,
    payment_portal_payment_methods integer,
    client_billing_type integer,
    custom_field_id text,
    custom_field_content_type_id text,
    meta jsonb,
    is_place boolean,
    shift_type integer,
    group_concurrent_invoice integer,
    type_of_care integer,
    mobile_location_geofence_radius text,
    place_id bigint,
    patient_type integer,
    community_room_details text,
    date_deleted text,
    default_community_task_set_id text,
    add_surcharge boolean,
    tasks_build_started text,
    disable_missed_clock_inout_alerts text,
    cuid text,
    tax_jurisdiction_cuid text,
    a_r_analyst_id text,
    secondary_marketer_id text,
    secondary_scheduler_id text,
    is_auto_clock_in text,
    franchisor_id integer,
    firstname text,
    lastname text
);


CREATE TABLE public.shifts (
    id bigint NOT NULL,
    patient_id bigint,
    caregiver_id bigint,
    shift_id bigint,
    pay_rate_type integer,
    pay_rate_amount numeric,
    bill_rate_type integer,
    bill_rate_amount numeric,
    clock_in timestamp without time zone,
    clock_out timestamp without time zone,
    pay_ot text,
    pay_dot text,
    pay_auto_ot text,
    pay_auto_dot text,
    bill_ot text,
    bill_dot text,
    bill_auto_ot text,
    bill_auto_dot text,
    pay_finalized boolean,
    bill_finalized boolean,
    pay_exported boolean,
    bill_exported boolean,
    agency_id bigint,
    parent_id text,
    split boolean,
    child_letter text,
    pay_pro_rate boolean,
    bill_pro_rate boolean,
    status integer,
    complete boolean,
    shift_date date,
    cci_scheduled_clock_in timestamp without time zone,
    cci_scheduled_clock_out timestamp without time zone,
    cci_actual_clock_in timestamp without time zone,
    cci_actual_clock_out timestamp without time zone,
    prevent_clock_out boolean,
    pay_export_queue boolean,
    bill_export_queue boolean,
    old_clock_in_method text,
    old_clock_out_method text,
    pay_average_rate text,
    pay_auto_ot_is_week boolean,
    pay_auto_dot_is_week boolean,
    client_esig_required boolean,
    caregiver_esig_required boolean,
    caremanager_esig_required boolean,
    pay_rate_name text,
    bill_rate_name text,
    pay_reg_for_live_ins text,
    bill_reg_for_live_ins text,
    pay_holiday_multiplier text,
    bill_holiday_multiplier text,
    pay_live_in_hours_to_count text,
    bill_live_in_hours_to_count text,
    bill_invoiced boolean,
    pay_excel_exported boolean,
    bill_amount text,
    pay_amount text,
    clock_in_method integer,
    clock_out_method integer,
    clock_in_point_accuracy text,
    clock_out_point_accuracy text,
    is_last_child boolean,
    authorization_id text,
    total_hours numeric,
    payments_total numeric,
    authorization_split_amount text,
    authorization_split_item_id text,
    in_facility boolean,
    in_facility_pay_rates boolean,
    pay_rate_obj_id text,
    bill_rate_obj_id text,
    rate_category_id text,
    deleted text,
    originator_id text,
    last_updated_by_id text,
    deleted_by_id text,
    created timestamp without time zone,
    updated timestamp without time zone,
    overtime_rate_type integer,
    clocked_out boolean,
    meta jsonb,
    clock_in_point text,
    clock_out_point text,
    date_deleted text,
    new_total_bill_hours numeric,
    new_total_pay_hours numeric,
    bill_and_pay_type integer,
    place_id text,
    hash text,
    original_bill_rate_amount numeric,
    original_pay_rate_amount numeric,
    bill_tiered text,
    pay_tiered text,
    pay_rate_category_id text,
    is_community_care boolean,
    carelog_edit_ip_address text,
    clock_in_ip_address text,
    clock_out_ip_address text,
    bill_rounding_rule integer,
    pay_rounding_rule integer,
    cuid text,
    edit_reason_code text,
    revision_num text,
    transaction_date text,
    service_cuid text,
    bill_version text,
    pay_version text,
    bill_segments text,
    pay_segments text,
    franchisor_id integer
);


CREATE TABLE public.tasks (
    id bigint NOT NULL,
    task_id bigint,
    title text,
    description text,
    care_log_id bigint,
    status text,
    recorded timestamp without time zone,
    cci_start timestamp without time zone,
    cci_end timestamp without time zone,
    original_tz text,
    general_comment boolean,
    created timestamp without time zone,
    updated timestamp without time zone,
    deleted text,
    originator_id text,
    last_updated_by_id text,
    deleted_by_id text,
    client_task_instance_id text,
    duration text,
    date_deleted text,
    agency_id bigint,
    franchisor_id integer
);


INSERT INTO public.clients VALUES (3064655, 12197165, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064656, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064657, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064658, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064659, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064660, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');
INSERT INTO public.clients VALUES (3064661, 12197166, '', false, '', '', 4, '', 11552, 6729, true, '', '2019-07-31', '', '', '', NULL, false, false, 1, '', '', '', '', '', '', '', '2019-01-16 05:00:00', '2019-07-31 15:46:32.668', '2023-07-07 00:17:58.635', true, '', false, '', 12194872, '2019-01-16 16:09:12.897', '2023-07-07 00:17:58.635', '', '', 8504069, '', '', true, 3, 1, '', '', 'null', false, 0, 1, 0, '', 6537420, 1, '', '', '', false, '', '', 'cko34h3jo0ioy2jo72l48jc2r', '', '', '', '', '', 22, 'Jonas', 'McNab');


INSERT INTO public.shifts VALUES (385774099, 3064657, 7023201, 302295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (585774099, 3064656, 7023201, 202295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (585774098, 3064655, 7023201, 202295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (785774100, 3064660, 7023202, 302295353, 4, 0, 4, 0, '2023-09-21 21:00:00', NULL, '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 10, false, '2023-09-21', '2023-09-21 21:00:00', NULL, NULL, NULL, false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (462287733, 3064656, 7023201, 159501473, 1, 10, 4, 0, '2022-03-18 02:00:00', '2022-03-18 03:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2022-03-18', '2022-03-18 02:00:00', '2022-03-18 03:00:00', '2022-03-18 02:00:00', '2022-03-18 03:00:00', false, false, false, '', '', '', false, false, false, false, false, 'test post deploy', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 1, 0, '', '', false, false, '268085358', '', '', '', '', '', '', '2022-03-18 05:20:58.191', '2022-03-18 05:20:58.743', 99, false, 'null', '', '', '', 1, 1, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 1, 'cl0vz3q8e1a6g2kpoxwuk5x1r', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (462287736, 3064656, 7023201, 259501474, 1, 10, 4, 0, '2022-02-18 02:00:00', '2022-02-18 03:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2022-02-18', '2022-02-18 02:00:00', '2022-02-18 03:00:00', '2022-03-18 02:00:00', '2022-02-18 03:00:00', false, false, false, '', '', '', false, false, false, false, false, 'test post deploy', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 1, 0, '', '', false, false, '268085358', '', '', '', '', '', '', '2022-03-18 05:20:58.191', '2022-03-18 05:20:58.743', 99, false, 'null', '', '', '', 1, 1, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 1, 'cl0vz3q8e1a6g2kpoxwuk5x1r', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (462287735, 3064656, 7023201, 259501474, 1, 10, 4, 0, '2022-01-18 02:00:00', '2022-01-18 03:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2022-01-18', '2022-01-18 02:00:00', '2022-01-18 03:00:00', '2022-03-18 02:00:00', '2022-01-18 03:00:00', false, false, false, '', '', '', false, false, false, false, false, 'test post deploy', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 1, 0, '', '', false, false, '268085358', '', '', '', '', '', '', '2022-03-18 05:20:58.191', '2022-03-18 05:20:58.743', 99, false, 'null', '', '', '', 1, 1, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 1, 'cl0vz3q8e1a6g2kpoxwuk5x1r', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (485774099, 3064658, 7023201, 302295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (685774099, 3064659, 7023201, 302295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (785774099, 3064660, 7023201, 302295353, 4, 0, 4, 0, '2023-09-21 16:00:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:00:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (485774100, 3064658, 7023201, 302295353, 4, 0, 4, 0, NULL, NULL, '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 10, false, '2023-10-21', '2023-10-21 16:00:00', NULL, NULL, NULL, false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (685774100, 3064659, 7023202, 302295353, 4, 0, 4, 0, NULL, NULL, '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 10, false, '2023-10-21', '2023-09-21 21:00:00', NULL, NULL, NULL, false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (462287732, 3064655, 7023201, 159501473, 1, 10, 4, 0, '2022-03-17 02:00:00', '2022-03-17 03:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2022-03-17', '2022-03-17 02:00:00', '2022-03-18 03:00:00', '2022-03-18 02:00:00', '2022-03-18 03:00:00', false, false, false, '', '', '', false, false, false, false, false, 'test post deploy', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 1, 0, '', '', false, false, '268085358', '', '', '', '', '', '', '2022-03-18 05:20:58.191', '2022-03-18 05:20:58.743', 99, false, 'null', '', '', '', 1, 1, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 1, 'cl0vz3q8e1a6g2kpoxwuk5x1r', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (885774100, 3064661, 7023201, 302295353, 4, 0, 4, 0, '2023-09-21 16:18:00', '2023-09-21 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-21', '2023-09-21 16:00:00', '2023-09-21 18:00:00', '2023-09-21 16:18:00', '2023-09-21 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);
INSERT INTO public.shifts VALUES (885774099, 3064661, 7023201, 302295353, 4, 0, 4, 0, '2023-09-15 16:12:00', '2023-09-15 20:00:00', '', '', '', '', '', '', '', '', false, false, false, false, 6729, '', false, '', false, false, 30, false, '2023-09-15', '2023-09-15 16:00:00', '2023-09-15 18:00:00', '2023-09-15 16:12:00', '2023-09-15 18:00:00', false, false, false, '', '', '', false, false, false, false, false, '', '', '', '', '', '', '', '', false, false, '', '', 5, 5, '', '', false, '', 2, 0, '', '', false, false, '', '', '', '', '', '', '', '2023-09-21 20:26:41.703', '2023-09-21 20:26:41.8', 99, false, 'null', '', '', '', 2, 2, 0, '', '', 0, 0, '', '', '', false, '', '', '', 2, 0, 'clmtmiq2l4yo0h17lbcdvthzw', '', '', '', '', '', '', '', '', 22);


INSERT INTO public.tasks VALUES (4642854874, 180019417, 'Bathe the client', '', 485774100, '', NULL, '2023-10-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (4642854875, 180019417, 'Take to toilet', '', 485774100, '', NULL, '2023-10-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (6642854874, 180019417, 'Bathe the client', '', 685774100, '', NULL, '2023-10-21 20:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (6642854875, 180019417, 'Take to toilet', '', 685774100, '', NULL, '2023-10-21 20:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1995042595, 894264599, 'Assist client with meal', '', 479075315, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-01 20:00:37.026', '2022-06-01 20:00:37.026', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1995042598, 894264598, 'Brush hair', '             ', 479075315, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-01 20:00:37.032', '2022-06-01 20:00:37.032', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1895934990, 854517794, 'Brush hair', '             ', 462287732, '1', NULL, '2022-03-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.434', '2022-03-18 05:20:58.434', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1895934989, 854517795, 'Assist client with meal', '', 462287732, '1', NULL, '2022-03-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.428', '2022-03-18 05:20:58.428', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1990754139, 894264598, 'Brush hair', '             ', 478353389, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-29 20:18:45.947', '2022-05-29 20:18:45.947', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1990754138, 894264599, 'Assist client with meal', '', 478353389, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-29 20:18:45.942', '2022-05-29 20:18:45.942', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2059928095, 927349555, 'Brush hair', '             ', 490018372, '1', NULL, '2022-07-21 08:00:00', NULL, 'UTC', false, '2022-07-21 04:20:59.363', '2022-07-21 04:20:59.363', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2059928094, 927349556, 'Assist client with meal', '', 490018372, '1', NULL, '2022-07-21 08:00:00', NULL, 'UTC', false, '2022-07-21 04:20:59.361', '2022-07-21 04:20:59.361', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1991914730, 894264598, 'Brush hair', '             ', 478549592, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-30 20:20:03.868', '2022-05-30 20:20:03.868', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1991914729, 894264599, 'Assist client with meal', '', 478549592, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-30 20:20:03.863', '2022-05-30 20:20:03.863', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1998088359, 894264599, 'Assist client with meal', '', 479583492, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-03 20:19:53.67', '2022-06-03 20:19:53.67', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1998088360, 894264598, 'Brush hair', '             ', 479583492, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-03 20:19:53.678', '2022-06-03 20:19:53.678', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2642854873, 180019417, 'Take to toilet', '', 585774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1996563112, 894264598, 'Brush hair', '             ', 479331910, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-02 20:19:19.168', '2022-06-02 20:19:19.168', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1996563110, 894264599, 'Assist client with meal', '', 479331910, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-06-02 20:19:19.162', '2022-06-02 20:19:19.162', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1993523765, 894264599, 'Assist client with meal', '', 478819550, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-31 20:18:31.398', '2022-05-31 20:18:31.398', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1993523766, 894264598, 'Brush hair', '             ', 478819550, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-31 20:18:31.401', '2022-05-31 20:18:31.401', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1989962045, 894264599, 'Assist client with meal', '', 478210475, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-28 20:19:52.556', '2022-05-28 20:19:52.556', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1989962046, 894264598, 'Brush hair', '             ', 478210475, '1', NULL, '2022-05-29 08:00:00', NULL, 'UTC', false, '2022-05-28 20:19:52.562', '2022-05-28 20:19:52.562', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934990, 854517794, 'Brush hair', '             ', 462287733, '1', NULL, '2022-03-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.434', '2022-03-18 05:20:58.434', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934989, 854517795, 'Assist client with meal', '', 462287733, '1', NULL, '2022-03-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.428', '2022-03-18 05:20:58.428', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934993, 854517794, 'Brush hair', '             ', 462287736, '1', NULL, '2022-02-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.434', '2022-03-18 05:20:58.434', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934994, 854517795, 'Assist client with meal', '', 462287736, '1', NULL, '2022-02-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.428', '2022-03-18 05:20:58.428', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934991, 854517794, 'Brush hair', '             ', 462287735, '1', NULL, '2022-01-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.434', '2022-03-18 05:20:58.434', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2895934992, 854517795, 'Assist client with meal', '', 462287735, '1', NULL, '2022-01-18 08:00:00', NULL, 'UTC', false, '2022-03-18 05:20:58.428', '2022-03-18 05:20:58.428', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2642854872, 180019417, 'Change bed linens', '', 585774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2642854870, 180019416, 'Check undergarment supply', '             ', 585774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.756', '2023-09-21 20:26:41.756', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (2642854871, 180019417, 'Assist with transfers', '', 585774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1642854870, 180019416, 'Brush hair', '             ', 585774098, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.756', '2023-09-21 20:26:41.756', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (1642854871, 180019417, 'Assist client with meal', '', 585774098, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (3642854871, 180019417, 'Assist with transfers', '', 385774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (3642854873, 180019417, 'Take to toilet', '', 385774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (4642854871, 180019417, 'Assist with transfers', '', 485774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (4642854873, 180019417, 'Take to toilet', '', 485774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (6642854871, 180019417, 'Assist with transfers', '', 685774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (6642854873, 180019417, 'Take to toilet', '', 685774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (7642854871, 180019417, 'Assist with transfers', '', 785774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (7642854873, 180019417, 'Feed Lunch', '', 785774099, '2', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (7642854874, 180019417, 'Bathe the client', '', 785774100, '', NULL, '2023-10-21 20:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (7642854875, 180019417, 'Feed Lunch', '', 785774100, '', NULL, '2023-10-21 20:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (5642854874, 180019417, 'Assist with transfers', '', 885774100, '1', NULL, '2023-09-15 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (5642854875, 180019417, 'Take to toilet', '', 885774100, '1', NULL, '2023-09-15 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (5642854871, 180019417, 'Assist with transfers', '', 885774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
INSERT INTO public.tasks VALUES (5642854873, 180019417, 'Take to toilet', '', 885774099, '1', NULL, '2023-09-21 08:00:00', NULL, 'UTC', false, '2023-09-21 20:26:41.749', '2023-09-21 20:26:41.749', '', '', '', '', '', '', '', 6729, 22);
