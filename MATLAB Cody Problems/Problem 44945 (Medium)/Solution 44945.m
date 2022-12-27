function bmi = bmi_calculator(hw)
hw(:,1) = hw(:,1) .* 0.0254;
  hw(:,2) = hw(:,2) ./ 2.2;
  bmi = (hw(:,2)) ./ (hw(:,1)).^2
end
