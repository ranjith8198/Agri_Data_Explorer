-- ==========================================================
-- 1. Year-wise Trend of Rice Production Across Top 3 States
-- ==========================================================
create view top3_rice_production as
SELECT year, state_name, SUM(rice_production_1000_tons) as total_rice_prod
FROM public.agri_data
WHERE state_name IN (
    SELECT state_name FROM public.agri_data 
    GROUP BY state_name ORDER BY SUM(rice_production_1000_tons) DESC LIMIT 3
)
GROUP BY year, state_name
ORDER BY year, total_rice_prod DESC;

-- ==========================================================
-- 2. Top 5 Districts by Wheat Yield Increase (Last 5 Years)
-- ==========================================================
create view Top5_Districts_by_Wheat_Yield_Increase as
SELECT dist_name, state_name,
       MAX(wheat_yield_kg_per_ha) - MIN(wheat_yield_kg_per_ha) as yield_growth
FROM public.agri_data
WHERE year >= (SELECT MAX(year) - 5 FROM public.agri_data)
GROUP BY dist_name, state_name
ORDER BY yield_growth DESC LIMIT 5;

-- ==========================================================
-- 3. Top 5 States: Oilseed Production Growth Rate (5-Year)
-- ==========================================================
create view top_5_states_oilseedproduction_growthrate
SELECT state_name, 
       ((MAX(oilseeds_production_1000_tons) - MIN(oilseeds_production_1000_tons)) / 
       NULLIF(MIN(oilseeds_production_1000_tons), 0)) * 100 as growth_rate
FROM public.agri_data
WHERE year >= (SELECT MAX(year) - 5 FROM public.agri_data)
GROUP BY state_name
HAVING MIN(oilseeds_production_1000_tons) > 0
ORDER BY growth_rate DESC 
LIMIT 5;
-- ==========================================================
-- 4. Correlation Data: Area vs Production (Rice, Wheat, Maize)
-- ==========================================================
create view Correlation_Data_Area_vs_Production_Rice_Wheat_Maize as
SELECT dist_name, year,
       rice_area_1000_ha, rice_production_1000_tons, 
       wheat_area_1000_ha, wheat_production_1000_tons,
       maize_area_1000_ha, maize_production_1000_tons
FROM public.agri_data;

-- ==========================================================
-- 5. Yearly Cotton Growth Trend (Top 5 Producing States)
-- ==========================================================
create view yearly_cotton_growth_trend as
SELECT year, state_name, SUM(cotton_production_1000_tons) as cotton_prod
FROM public.agri_data
WHERE state_name IN (
    SELECT state_name FROM public.agri_data 
    GROUP BY state_name ORDER BY SUM(cotton_production_1000_tons) DESC LIMIT 5
)
GROUP BY year, state_name
ORDER BY year;

-- ==========================================================
-- 6. Districts with Highest Groundnut Production in 2017
-- ==========================================================
create view district_with_highest_groundnut_production_2017 as
SELECT dist_name, state_name, groundnut_production_1000_tons
FROM public.agri_data
WHERE year = 2017
ORDER BY groundnut_production_1000_tons DESC LIMIT 10;

-- ==========================================================
-- 7. Annual Average Maize Yield Across All States
-- ==========================================================
create view annual_average_maize_yield_across_all_states as
SELECT year, AVG(maize_yield_kg_per_ha) as avg_maize_yield
FROM public.agri_data
GROUP BY year
ORDER BY year;

-- ==========================================================
-- 8. Total Area Cultivated for Oilseeds by State
-- ==========================================================
create view total_area_cultivated_for_oilseeds_by_state as
SELECT state_name, SUM(oilseeds_area_1000_ha) as total_oilseed_area
FROM public.agri_data
GROUP BY state_name
ORDER BY total_oilseed_area DESC;

-- ==========================================================
-- 9. Top 10 Districts by Highest Rice Yield
-- ==========================================================
create view top_10_district_by_highest_rice_yield as
SELECT dist_name, state_name, MAX(rice_yield_kg_per_ha) as max_yield
FROM public.agri_data
GROUP BY dist_name, state_name
ORDER BY max_yield DESC LIMIT 10;

-- ==========================================================
-- 10. Rice vs Wheat Production Comparison (Top 5 States, 10 Years)
-- ==========================================================
create view top_5_rice_vs_wheat_production_comparison_10years as
SELECT year, state_name, 
       SUM(rice_production_1000_tons) as rice_total, 
       SUM(wheat_production_1000_tons) as wheat_total
FROM public.agri_data
WHERE year >= (SELECT MAX(year) - 10 FROM public.agri_data)
AND state_name IN (
    SELECT state_name FROM public.agri_data 
    GROUP BY state_name ORDER BY (SUM(rice_production_1000_tons) + SUM(wheat_production_1000_tons)) DESC LIMIT 5
)
GROUP BY year, state_name
ORDER BY year, state_name;