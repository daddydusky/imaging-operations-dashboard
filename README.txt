# Imaging Operations Dashboard (Simulated Data)

## Overview

This project simulates one year of activity for a small imaging centre and visualises key operational metrics in an interactive Power BI dashboard.

The focus is on operational questions an imaging manager or clinical lead might ask, such as:
- How many scans are we doing overall and by modality?
- How long are patients waiting?
- What is our cancellation rate?
- How does volume vary over time?

---

## Data & Simulation

The dataset is **simulated** using R to mimic a realistic workload for a small imaging centre.

**Key assumptions:**
- Time period: 1 full year (2024)
- Total scans: 670
- Modalities: PET-CT, CT, MRI, X-ray, Ultrasound
- Patients: some attend once, others have 2–3+ scans across the year
- Each row = 1 scan

**Main fields:**
- `scan_id`: Unique identifier for each scan
- `patient_id`: Patient identifier (non-unique; some patients appear multiple times)
- `scan_date`: Date of the scan
- `appointment_date`: Date the scan was booked
- `modality`: PET-CT, CT, MRI, X-ray, Ultrasound
- `referrer_type`: Oncology, Cardiology, GP, Other Hospital
- `wait_days`: Days between appointment and scan
- `cancelled`: Yes/No
- `no_show`: Yes/No

The data is generated in R (see `imaging_ops_01.R`) and exported to `imaging_activity_simulated.csv` for use in Power BI.

---

## Tools Used

- **R**
  - Data simulation
  - Basic exploratory checks
- **Power BI Desktop**
  - Interactive dashboard and visualisation
- **Git & GitHub**
  - Version control and portfolio hosting

---

## Dashboard Contents

The main Power BI report page includes:

- **KPI cards**
  - Total scans (count of `scan_id`)
  - Unique patients (distinct count of `patient_id`)
  - Average wait time (days)
  - Cancellation rate (% of scans with `cancelled = "Yes"`)

- **Charts**
  - Total scans by modality
  - Daily scan volume (line chart)
  - Monthly scan volume (column chart), with the highest-volume month highlighted in the narrative

- **Filters**
  - Slicer by modality (PET-CT, CT, MRI, X-ray, Ultrasound)

These elements allow users to quickly understand workload, modality mix, variability over time, and headline access/cancellation metrics.

---

## Possible Use Cases

Although the data is simulated, this structure could support:

- **Imaging department managers**
  - Monitoring scan volumes by modality
  - Tracking demand patterns across the year
  - Identifying high-cancellation areas

- **Clinical leads and service planners**
  - Reviewing waiting times
  - Comparing modalities and referrer types
  - Planning capacity and staffing

- **Quality improvement or audit teams**
  - Establishing baseline operational metrics
  - Identifying trends to investigate further

---

## Files in This Repository

- `imaging_ops_01.R`  
  R script used to generate the simulated dataset.

- `imaging_activity_simulated.csv`  
  Simulated scan-level dataset used by the Power BI report.

- `Imaging_Activity_Overview.pbix`  
  Power BI Desktop file containing the dashboard.

- `README.md`  
  Project overview and documentation.

---


