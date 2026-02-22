library(tidyverse)
library(lubridate)
library(janitor)

set.seed(123)

# Total number of scans in the year
total_scans <- 670

# Define the date range for the year
start_date <- as.Date("2024-01-01")
end_date   <- as.Date("2024-12-31")

# Define modalities and their approximate proportions
modalities <- c("PET-CT", "CT", "MRI", "X-ray", "Ultrasound")
modality_probs <- c(0.25, 0.25, 0.2, 0.15, 0.15)  # adjust if you like

# 1) Define a pool of patients
#    e.g. 400 patients for 670 scans -> some will have multiple visits
n_patients <- 400
patient_ids <- 10001:(10000 + n_patients)

# 2) Decide how many scans each patient has
#    Most have 1, some have 2, a few have 3+
scan_counts <- sample(
  x = c(1, 2, 3),
  size = n_patients,
  replace = TRUE,
  prob = c(0.65, 0.25, 0.10)  # 65% have 1 scan, 25% have 2, 10% have 3
)

# Build a vector of patient IDs with repeats according to scan_counts
patient_id_vector <- rep(patient_ids, times = scan_counts)

# If we overshoot 670, trim; if we have less, top up by sampling
if (length(patient_id_vector) > total_scans) {
  patient_id_vector <- patient_id_vector[1:total_scans]
} else if (length(patient_id_vector) < total_scans) {
  extra_needed <- total_scans - length(patient_id_vector)
  patient_id_vector <- c(
    patient_id_vector,
    sample(patient_ids, extra_needed, replace = TRUE)
  )
}

length(patient_id_vector)  # should be 670

# 3) Create the scan-level dataset
imaging_data <- tibble(
  scan_id       = 1:total_scans,  # unique ID per scan
  patient_id    = sample(patient_id_vector, total_scans, replace = FALSE),
  scan_date     = sample(seq(start_date, end_date, by = "day"), total_scans, replace = TRUE),
  modality      = sample(modalities, total_scans, replace = TRUE, prob = modality_probs),
  referrer_type = sample(
    c("Oncology", "Cardiology", "GP", "Other Hospital"),
    total_scans, replace = TRUE,
    prob = c(0.4, 0.2, 0.3, 0.1)
  ),
  wait_days      = pmax(round(rnorm(total_scans, mean = 21, sd = 7)), 0),  # avg ~3 weeks
  cancelled_flag = rbinom(total_scans, 1, prob = 0.08),  # 8% cancelled
  no_show_flag   = rbinom(total_scans, 1, prob = 0.04)   # 4% no-show
) %>%
  mutate(
    appointment_date = scan_date - days(wait_days),
    cancelled        = if_else(cancelled_flag == 1, "Yes", "No"),
    no_show          = if_else(no_show_flag == 1, "Yes", "No")
  ) %>%
  select(-cancelled_flag, -no_show_flag) %>%
  clean_names()

# Quick checks
nrow(imaging_data)                         # should be 670
dplyr::n_distinct(imaging_data$patient_id) # number of unique patients
table(imaging_data$modality)

write_csv(imaging_data, "imaging_activity_simulated.csv")




