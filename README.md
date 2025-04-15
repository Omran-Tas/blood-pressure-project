# blood-pressure-project
Non-parametric analysis of longitudinal systolic blood pressure data across three visits.
🔍 Objective
To assess whether systolic blood pressure (SBP) significantly changes over time across three clinical visits.
📄 Data Description
•	Sample size: 30 patients
•	Variables: SBP at Visit 1 (SBP_V1), Visit 2 (SBP_V2), Visit 3 (SBP_V3)
•	Format: Wide-format CSV transformed into long-format for analysis
🧪 Methods Used
•	Data preprocessing: gather(), convert_as_factor()
•	Descriptive statistics: Mean, SD, median, range
•	Normality check: shapiro_test() → SBP not normally distributed
•	Non-parametric test: Friedman test for overall group comparison
•	Post hoc testing: Wilcoxon Signed-Rank Test with Bonferroni correction
📈 Results
•	Friedman Test: p < 0.0001 → Significant overall change in SBP
•	Wilcoxon Post Hoc Comparisons:
o	Visit 1 vs. Visit 2: Not significant
o	Visit 1 vs. Visit 3: *** Significant (p = 0.00059)
o	Visit 2 vs. Visit 3: **** Highly significant (p = 0.00037)
📊 Visualizations
•	Boxplots of SBP per visit with significance annotations using stat_pvalue_manual()
📁 Deliverables
•	Descriptive statistics table exported to CSV
•	Formatted result tables for Wilcoxon statistics and p-values
•	Clean and reproducible R script using rstatix and ggpubr
🛠️ Software & Packages
•	Software: R
•	Libraries: dplyr, tidyverse, rstatix, ggpubr, reshape2
✅ Conclusion
SBP significantly decreased over time, with the most substantial reduction observed between Visit 2 and Visit 3. This change may reflect a positive response to treatment, lifestyle changes, or other clinical interventions. The use of non-parametric methods provided robust inference in the presence of non-normal data, reinforcing the importance of appropriate statistical choices in longitudinal studies.

