files = dir('dataset\*.*g');

netA = resnet50;
layer = "avg_pool";
inputSizeA = netA.Layers(1).InputSize;

for i = 1:length(files)
    resPath = fullfile('dataset\', files(i).name);
    res = imread(resPath);
    res = imresize(res, inputSizeA(1:2));

    augimdsTrainA = augmentedImageDatastore(inputSizeA(1:2), res);

    try
        featuresTrain = activations(netA, augimdsTrainA, layer, 'OutputAs', 'rows');
    catch err
        disp(files(i).name);
    end

    X(i, :) = featuresTrain;
    fileLabel = split(files(i).name, '(');
    if contains(fileLabel{1}, 'S')
        y(i, 1) = 1;
    else
        y(i, 1) = 0;
    end

end

[idx, weights] = fscchi2(X, y);

selectedFeatures = X(:, idx(1:1000));
selectedFeatures(:, end+1) = y;


%%
clc
testModel = fitcsvm(X, y, 'Standardize', true, 'KernelFunction', 'RBF', 'KernelScale', 'auto');
testFiles = dir('aatestdata\*.*g');

wrongAnswerCounter = 0;

trueLabels = cell(length(testFiles), 1);
predictedLabels = cell(length(testFiles), 1);

for t = 1:length(testFiles)
    testFilePath = fullfile('aatestdata\', testFiles(t).name);
    testRes = imread(testFilePath);
    testRes = imresize(testRes, inputSizeA(1:2));
    augimdsTest = augmentedImageDatastore(inputSizeA(1:2), testRes);
    try
        featuresTest = activations(netA, augimdsTest, layer, 'OutputAs', 'rows');
    catch err
        disp(testFiles(t).name);
    end

    testResult = predict(testModel, featuresTest);

    testFileLabel = split(testFiles(t).name, ' ');
    if contains(testFileLabel{1}, 'BT')
        realResult = "Bıçak";
    else
        realResult = "Silah";
    end

    trueLabels{t} = realResult;
    if testResult == 0
        predictedLabels{t} = 'Bıçak';
    elseif testResult == 1
        predictedLabels{t} = 'Silah';
    else
        predictedLabels{t} = 'Tahmin Yapılamadı';
    end

    if (testResult == 0)
        fprintf("%d. Tahmin Sonucu : Bıçak |||| Gerçek Sonuç : %s \n", t, realResult);
        if ~strcmp(realResult, 'Bıçak')
            wrongAnswerCounter = wrongAnswerCounter + 1;
        end
    elseif (testResult == 1)
        fprintf("%d. Tahmin Sonucu : Silah |||| Gerçek Sonuç : %s \n", t, realResult)
        if ~strcmp(realResult, 'Silah')
            wrongAnswerCounter = wrongAnswerCounter + 1;
        end
    else
        fprintf("Tahmin Yapamadım");
        wrongAnswerCounter = wrongAnswerCounter + 1;
    end
end

fprintf("Yanlış Tahmin Sayısı : %d \n", wrongAnswerCounter);
%%


trueLabelsStr = string(trueLabels);
predictedLabelsStr = string(predictedLabels);

C = confusionmat(trueLabelsStr, predictedLabelsStr);

figure;
confusionchart(C, {'Bıçak', 'Silah'});

saveas(gcf, 'confusion_matrix.png');

%%
accuracyRate = sum(diag(C)) / sum(C(:)) * 100;
precisionBicak = C(1,1) / sum(C(:,1)) * 100;
precisionSilah = C(2,2) / sum(C(:,2)) * 100;
recallBicak = C(1,1) / sum(C(1,:)) * 100;
recallSilah = C(2,2) / sum(C(2,:)) * 100;
specificityBicak = C(2,2) / sum(C(2,:)) * 100;
specificitySilah = C(1,1) / sum(C(1,:)) * 100;

f1Bicak = 2 * (precisionBicak * recallBicak) / (precisionBicak + recallBicak);
f1Silah = 2 * (precisionSilah * recallSilah) / (precisionSilah + recallSilah);

fprintf('Accuracy: %.2f%%\n', accuracyRate);
fprintf('Precision (Bıçak): %.2f%%\n', precisionBicak);
fprintf('Precision (Silah): %.2f%%\n', precisionSilah);
fprintf('Recall (Bıçak): %.2f%%\n', recallBicak);
fprintf('Recall (Silah): %.2f%%\n', recallSilah);
fprintf('Specificity (Bıçak): %.2f%%\n', specificityBicak);
fprintf('Specificity (Silah): %.2f%%\n', specificitySilah);
fprintf('F1 Score (Bıçak): %.2f\n', f1Bicak);
fprintf('F1 Score (Silah): %.2f\n', f1Silah);
