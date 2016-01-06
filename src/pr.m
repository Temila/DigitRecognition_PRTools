% load digits as measurement variables
a = prnist([0:9],[1:50:1000]);
prepproc = im_rotate([], 220) * im_resize([], [15,15]) * im_box([], 0, 1);
pre_processed = a * prepproc;
digit_prset = prdataset(pre_processed, []);
% %add rows and columns to create square figure (aspect ratio 1)
feature_dataset = im_features(digit_prset, 'all');

[train_data, test_data] = gendat(feature_dataset, 0.5);

%features_data = features.data
features_mapping = featself(train_data);
f_train_data = train_data * features_mapping;
f_test_data = test_data * features_mapping;

w = knnc(f_train_data);
acc = 1 - (f_test_data * w * testc)

w2 = knnc(train_data);
acc2 = 1 - (test_data * w2 * testc)

%features_selected
% c = im_rotate(b, 220);
% figure(2);
% show(c);
% % resample by 20 x 20 pixels
%  c = im_resize(b,[15,15]); 
% % convert to PRTools dataset and display
%  d = prdataset(c,[]);
% %generate train_data (90%) and test_data (10%)
%  [train_data, test_data] = gendat(d,0.9);
% % train the neural network on test_data, 3 hidden layers, 15 nodes in each
% % layer.
%  w = bpxnc(train_data, [15 15 15], 1000);
% % test classifier on test data
% accuracy = 1 - (test_data * w * testc);
