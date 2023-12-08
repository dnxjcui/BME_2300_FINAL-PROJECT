## General Information
All the data and file naming conventions are taken from the source: https://physionet.org/content/auditory-eeg/1.0.0/

### data_prep_src
Contains files for prepping `.csv` files into more `.mat` files, for the purposes of this experiment and corresponding compatibility.
>**For user purposes**, you only have to edit the paths within `main.py` that are commented for one to do so.


### eval_src
Contains files that are used for evaluating the `.mat` files. Includes a sample script for how to use FFT, as well as various scripts for performing quantitative and qualitative analysis.

**Please note the file paths and change accordingly if you want to run the code on your local machine.**
>Notes to self - can consider adding stochastic resonance for segments with low signal power. FFT can/should be smoothed via some sort of algorithm: I personally propose arbitrarily binning the data via a constant.

Ultimately, used built-in MATLAB filter function in order to smooth the data enough to evaluate peaks. Chose to use F8 electrode simply on the basis of highest amplitude. We did not do a deep evaluation of this choice, currently an arbitrary choice.