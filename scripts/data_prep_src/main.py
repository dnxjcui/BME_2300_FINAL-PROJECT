from helper import *

if __name__ == "__main__":
    ## Change accordingly ##
    # data = "Filtered"
    data = "Segmented"
    ########################

    ## DO NOT CHANGE ##
    base_name = data + "_Data"
    target_name = base_name + "_mat"
    target_base = f"C:\\Users\\dnxjc\\OneDrive\\Desktop\\CURR\\bme 1\\FINAL PROJECT\\data\\{base_name}\\"
    output_dir = f"C:\\Users\\dnxjc\\OneDrive\\Desktop\\CURR\\bme 1\\FINAL PROJECT\\data\\{target_name}"
    target_file = "RECORDS.txt"
    run_save_mat(target_base, target_file, output_dir)
    ###################
