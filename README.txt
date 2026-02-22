Title: Imaging Centre Operations Dashboard (Simulated Data)

-Short summary:

This project simulates one year of activity for a small 
imaging centre and visualises key operational 
metrics in an interactive dashboard. Using R to generate realistic scan-level 
data and Power BI for reporting,
the dashboard helps monitor volumes, waiting times, cancellations,
and modality mix over time.

-Longer description:

I created a simulated dataset representing 670 imaging scans over one year
for a small centre offering PET‑CT, CT, MRI, X‑ray and Ultrasound. 
Each record represents a single scan and includes patient ID(with some patients having multiple visits), 
scan date,modality, referrer type, waiting time from booking to scan, and cancellation/no‑show status.

Using R, I generated the data to reflect realistic patterns, such as repeat 
attenders and varied waiting times. I then built a Power BI dashboard that shows:

-Total scans and unique patients over the year
-Average waiting time (days)
-Cancellation rate
-Scans by modality
-Daily and monthly scan volumes
-Interactive filtering by modality

This dashboard could support imaging managers and clinicians in understanding workload,
monitoring access and cancellations, and planning capacity across modalities.
