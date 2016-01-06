function num_features = calculateFeatureNum(train_data)
    %this function apply svd to help calculate num of features
    %argu: train_data, prdataset format
    %return: optimized num of features
    
    %singular value decomposition
    [U, S, V] = svd(train_data);
    %store diagnose length  of covariance matrix
    diag_length = length(diag(S));
    %store diagnose values of covrance matrix
    diag_values = diag(S);
    %store sum of diagnose values
    diag_sum = sum(diag(S));
    %
    current_sum = 0;
    for x = 1:diag_length
        current_sum = current_sum + diag_values(x);
        current_ratio = current_sum/diag_sum;
        %95% of variance is retained
        if current_ratio > 0.95
            num_features = x
            break
        end
    end
end