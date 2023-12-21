function [snowload_kg_per_m2,flag_roof,flag_deck] = getSnowLoad_kg_per_m2(wet_snow_cm, snowfall_cm_per_hr, snowfall_duration_hr)
  snowload_kg_per_m2 = 200*(wet_snow_cm / 100) + (50*(snowfall_cm_per_hr*snowfall_duration_hr)*0.01);
  if snowload_kg_per_m2 > 145
      flag_roof = 2;
  elseif snowload_kg_per_m2 > 98
      flag_roof = 1;
  else
      flag_roof = 0;
  end
  
  if snowload_kg_per_m2 > 293
      flag_deck = 2;
  elseif snowload_kg_per_m2 > 195
      flag_deck = 1;
  else
      flag_deck = 0;
  end
end
