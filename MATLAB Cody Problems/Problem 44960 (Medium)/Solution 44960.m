function X = rescale_scores(X)
avg_vector = X(:,[end])


gpa_vector = 0.1.*(avg_vector - 60)
X = [X(:,1:end-1) gpa_vector]
    
end
