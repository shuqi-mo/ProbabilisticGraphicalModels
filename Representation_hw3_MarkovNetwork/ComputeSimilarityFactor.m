function factor = ComputeSimilarityFactor (images, K, i, j)
% This function computes the similarity factor between two character images
% in one word --- which characters is given by indices i and j (a
% description of how the factor should be computed is given below).
%
% Input:
%   images: A struct array of character images from one word.
%   K: The alphabet size.
%   i,j: The scope of that factor. That is, you should construct a factor
%     between characters i and j in the images array.
%
% Output:
%   factor: The similarity factor between these two characters. For any
%     assignment C_i != C_j, the factor value should be one. For any
%     assignment C_i == C_j, the factor value should be
%     ImageSimilarity(I_i, I_j) --- ie, the computed value given by
%     ImageSimilarity.m on the two images.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

factor = struct('var', [], 'card', [], 'val', []);

% Your code here:
if (i<=length(images) && j<=length(images))
    I_i = images(i).img;
    I_j = images(j).img;
    similarity = ImageSimilarity(I_i, I_j);
    factor.var =[i, j];
    factor.card = [K, K];
    factor.val = ones(K*K, 1);
    for Ci = 1:K
        for Cj = 1:K
            if Ci == Cj
                factor.val((Ci - 1)*K + Cj) = similarity;
            end
        end
    end
end

end

