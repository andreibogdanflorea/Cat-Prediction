<div align="left">
  <h1>Cat Prediction</h1>
  <h3>An Octave/MATLAB project that tries to classify cat and non-cat images</h3>
</div>
<br/>
<br/>

## Householder prediction ##
While being in the Householder prediction folder, run the following command in Octave/MATLAB to
create the features matrix X and the label vector y:

`[X, y] = preprocess('dataset/', histogram_type, count_bins)`

where histogram_type can be either 'RGB' or 'HSV', and count_bins is an integer (16 or 20 work well)
  
To train the model:
 
`w = learn(X, y)`

To evaluate the model:

`percentage = evaluate('testset/', w, histogram_type, count_bins)`

where histogram_type and count_bins should be the ones used in the preprocessing.
<br><br><br>

## Gradient Descent prediction ##
For bigger databases, the Householder prediction does not scale well and the Gradient Descent method
fits better.

To create the features matrix X and the label vector y, while being in the Gradient Descent prediction folder:

`[X, y] = preprocess('dataset/', histogram_type, count_bins)`

where histogram_type can be either 'RGB' or 'HSV', and count_bins is an integer (16 or 20 work well)
  
To train the model:

`w = learn(X, y, lr, epochs)`

where lr represents the learning rate; numbers that work well are lr = 0.01 and epochs = 500

To evaluate the model:

`percentage = evaluate('testset/', w, histogram_type, count_bins)`

where histogram_type and count_bins should be the ones used in the preprocessing.
