<p align="center">
  <img src="https://github.com/user-attachments/assets/3102e58e-19eb-4b28-b99a-c31ab29d57c6" width="70" alt="R Logo"/>
</p>

<h1 align="center">SL Hotel & Tourism GIS Analytics 2025</h1>
<h4 align="center">BUILT WITH R SCRIPTS, QGIS, GOOGLE EARTH, AND POSTGIS</h4>

<p align="center">
  <img src="https://github.com/user-attachments/assets/26606e99-9b2f-4111-acf0-7f571a3b6946" height="40" alt="QGIS"/>
  <img src="https://github.com/user-attachments/assets/4f4cede6-ffcc-4bcb-8530-c2a00e5a48f6" height="40" alt="Google Earth"/>
  &nbsp;&nbsp;
  <img src="https://cdn.worldvectorlogo.com/logos/postgresql.svg" height="40" alt="PostgreSQL"/>
</p>

---

A comprehensive **data analytics and geospatial intelligence project** focused on Sri Lanka’s hotel and tourism sector.
The project combines **statistical modeling, spatial visualization, geospatial databases, and suitability analysis** to support data-driven tourism planning and decision-making.

## 🚀 Project Overview

This project integrates **R-based analytics** and **GIS workflows** to analyze hotel performance, global tourist arrivals, tourism development zones, institutional locations, and site suitability for regional tourism infrastructure.

It demonstrates an end-to-end workflow covering:

* Data preparation and modeling
* Spatial data processing
* Database-driven GIS
* High-quality cartographic outputs

---

## 🔍 Key Components
This section explains the main parts of the project and what each folder contains:

### 📊 Hotel Revenue Analytics (R_Hotel_Revenue_Analysis)

* Exploratory data analysis
* Correlation analysis
* Simple and multiple linear regression models
* Model validation using ANOVA, AIC, BIC, RMSE
* Diagnostic and multicollinearity checks
* Automated export of plots, tables, and summaries

### 🌍 Global Tourist Arrivals Mapping (R_SL_Tourists_2025)

* Cleaning and transformation of international tourist arrival data
* Creation of a country-level dataset
* World map visualization classified by tourist volume
* Clear spatial patterns to support market analysis

### 🏢 STDA Spatial Digitization (STDA_GIS_Digitization)

* Digitized spatial representation of Sri Lanka Tourism Development Authority and surrounding suburbs
* Georeferenced base imagery
* Structured vector layers with meaningful attributes
* Clear spatial context for institutional operations

### 🗺 Tourism Development Zones (SL_Tourism_Development_Zones)

* GPS-accurate tourism development zone locations
* KML data created using Google Earth
* Integration with QGIS for visualization
* Centralized storage in a PostGIS spatial database
* Clean and professional thematic map output

### 📍 Regional Tourism Development Center Suitability (Regional_Tourism_Development_Center_Analysis)

* Multi-criteria spatial suitability analysis
* Distance-based constraints
* Land use and soil condition filtering
* Identification of optimal land parcels
* Quantification of buildings and available land area
* Final suitability map for planning decisions

---

## 🛠 Technologies Used
The following technologies are used in this project:

| Technology        | Description |
|------------------|-------------|
| R / RStudio      | Used for statistical analysis, data modeling, and visualization of hotel revenue data |
| QGIS             | Used for spatial data processing, mapping, and cartographic visualization |
| PostgreSQL       | Relational database system used to store and manage structured data |
| PostGIS          | Spatial extension of PostgreSQL used for geospatial data storage and analysis |
| Google Earth     | Used for collecting GPS coordinates and creating KML files |
| OpenStreetMap    | Provided base map data for spatial visualization |
| Excel / CSV      | Used for data cleaning, preprocessing, and transformation |

---

## 📂 Project Structure
The following project structure is used:

```
Data/
R_Hotel_Revenue_Analysis/
R_SL_Tourists_2025/
Regional_Tourism_Development_Center_Analysis/
SL_Tourism_Development_Zones/
STDA_GIS_Digitization/
```

---

## 📦 Getting Started
Follow the steps below to set up and run the project successfully:

#### 1. ✅ Clone the Repository:

```bash
git clone https://github.com/PAIshanMadusha/sl-hotel-tourism-gis-analytics-2025.git
````

#### 2. ✅ Navigate to the Project Directory:

```bash
cd sl-hotel-tourism-gis-analytics-2025
```

#### 3. ✅ Run the Scripts and Maps Locally:

* Navigate to each project folder and run the R scripts using RStudio. For example:

```bash
Hotel_Revenue_Analysis_2025.R
```

* Open the QGIS project files by navigating to the relevant folder and opening the `.qgz` files in the QGIS application. For example:

```bash
Tourist_Arrivals_2025_Project.qgz
```

## 📸 System Screenshots
The following images show sample maps created in QGIS during the project development:

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/c79f42c6-e8b8-4ab5-b70f-5a63c8b37af9" alt="Screenshot 1" width="800">
  <br><br>
  <img src="https://github.com/user-attachments/assets/1edf9bcb-a5ea-48a4-a5cc-9f59036a53e9" alt="Screenshot 2" width="800">
</p>

---

### ❤️ Created by: 
**Ishan Madhusha**  
GitHub: [PAIshanMadusha](https://github.com/PAIshanMadusha)

Feel free to explore my work and get in touch if you'd like to collaborate! 🚀

---

## 📝 License
This project is licensed under the MIT License : See the [LICENSE](LICENSE) file for details.
