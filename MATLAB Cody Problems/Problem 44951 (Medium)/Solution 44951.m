function dice_diff = loln(N)
  vector = randi([1 N],1e8,1);
    allints = 1:1:N;
dice_diff = mean(vector) - mean(allints);
end
