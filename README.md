# Project: Analyzing Police Accountability and Civilian Complaints

This project is the final submission for the MA415 Data Science with R course by **Team 12**, focusing on exploring relationships between police department practices and civilian complaints. The study leverages data science techniques to uncover trends and provide actionable insights on policing.

---

##  About the Project

This project investigates:
- The impact of **police force diversity** on civilian complaints.
- Whether the **use of less lethal force** correlates with fewer complaints.
- How systemic reforms and data transparency could improve police accountability.

The project primarily uses the **Police Scorecard** database, a comprehensive nationwide dataset that evaluates police performance on several critical metrics, such as use of force, accountability, racial bias, and community impact.

---

##  Project Structure

### **Key Folders**
- **`config/`**: Quarto configuration files for the website and report layout.
- **`data/`**: Contains datasets:
  - `raw/`: Original datasets.
  - `processed/`: Cleaned and transformed datasets.
- **`images/`**: Visualizations such as heatmaps, regression plots, and bar charts.
- **`misc/`**: Temporary or less critical files.
- **`scripts/`**: R scripts for data analysis and modeling.
- **`_freeze/`**: Rendered content for the Quarto website (not directly edited).

### **Key Files**
- `index.qmd`: Homepage for the Quarto-generated website.
- `analysis.qmd`: Detailed analysis and findings.
- `data.qmd`: Data sources, cleaning processes, and variable descriptions.
- `big_picture.qmd`: Exploration of broader themes and project motivations.
- `_quarto.yml`: Configuration for the Quarto website.

---

##  Data Overview

### **Sources**
The project primarily utilizes the **Police Scorecard** database, accessible at [policescorecard.org](https://policescorecard.org/). This dataset consolidates information from:
- The FBI’s Uniform Crime Report.
- Bureau of Justice Statistics.
- U.S. Census Bureau.
- California Department of Justice.

### **Key Datasets**
1. **Civilian Complaints Data**
   - Complaints filed against police departments, categorized by type (e.g., use of force, discrimination).
2. **Use of Force Data**
   - Details on police use of force incidents, including non-lethal methods.
3. **Officer Demography**
   - Demographic data on police officers (e.g., race, gender).

### **Cleaning and Transformation**
- Missing values were replaced with appropriate defaults.
- Variables were standardized using `janitor::clean_names()`.
- A **Shannon Diversity Index** was calculated to measure the diversity of police forces.

---

##  Analysis and Findings

### **Research Questions**
1. Does greater diversity within police departments correlate with fewer civilian complaints?
2. Is there a significant relationship between less lethal force usage and the volume of civilian complaints?

### **Key Findings**
- **Diversity and Complaints**:
  - Initial exploration suggested potential correlations, but regression analysis revealed no significant relationship.
- **Use of Force**:
  - Contrary to expectations, less lethal force usage did not strongly correlate with a decrease in civilian complaints.
- **Broader Insights**:
  - Public perception focuses on the use of force itself, regardless of severity, as a key factor in generating complaints.

### **Visualizations**
- Heatmaps illustrating correlations between variables.
- Regression plots showing relationships between force usage and complaints.
- Bar charts comparing complaint rates across cities and years.

---

## Acknowledgement

# MA415 Final Project

This repository contains the final project for MA415, focusing on diversity metrics and data visualization.
This project was originally forked from sussmanbu/ma-4615-fa23-final-project-team-12.

