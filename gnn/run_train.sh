# python main.py --dataset soybean --data_dir ../data/soybean_data_full.npz -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 32 --max_epoch 100 --test_year 2018 -lr 5e-4 --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine

# python main.py --dataset soybean --data_dir ../data/soybean_data_full.npz -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 32 --max_epoch 100 --test_year 2018 -lr 3e-4 --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine

# python main.py --dataset soybean --data_dir ../data/soybean_data_full.npz -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 32 --max_epoch 100 --test_year 2018 -lr 1e-4 --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine

# python main.py --dataset corn_weekly --data_dir /mnt/beegfs/bulk/mirror/jyf6/datasets/crop_forecast/data/combined_dataset_weekly.npz  \
#     -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 128 --max_epoch 100 --test_year 2018 -lr 1e-4 \
#     --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine \
#     --crop_type corn --num_weather_vars 23 --num_management_vars 96 --num_soil_vars 20 --num_extra_vars 6 --soil_depths 6 --no_management

# python main.py --dataset corn_weekly --data_dir /mnt/beegfs/bulk/mirror/jyf6/datasets/crop_forecast/data/combined_dataset_weekly.npz  \
#     -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 64 --max_epoch 100 --test_year 2018 -lr 1e-4 \
#     --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine \
#     --crop_type corn --num_weather_vars 23 --num_management_vars 96 --num_soil_vars 20 --num_extra_vars 6 --soil_depths 6 --no_management

# python main.py --dataset corn_weekly --data_dir /mnt/beegfs/bulk/mirror/jyf6/datasets/crop_forecast/data/combined_dataset_weekly.npz  \
#     -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs 32 --max_epoch 100 --test_year 2018 -lr 1e-4 \
#     --eta_min 1e-5 --check_freq 80 --T0 50 -sche cosine \
#     --crop_type corn --num_weather_vars 23 --num_management_vars 96 --num_soil_vars 20 --num_extra_vars 6 --soil_depths 6 --no_management

for y in 2018 2019
do
    for l in 1e-5 1e-4 1e-3
    do
        python main.py --dataset soybeans_weekly --data_dir /mnt/beegfs/bulk/mirror/jyf6/datasets/crop_forecast/data/combined_dataset_weekly.npz  \
            -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
            --mode train --length 5 -bs 64 --max_epoch 100 --test_year $y -lr $l \
            --eta_min 1e-5 --check_freq 80 --T0 100 -sche cosine --dropout 0.1 --z_dim 64 \
            --crop_type soybeans --num_weather_vars 23 --num_management_vars 96 --num_soil_vars 20 \
            --num_extra_vars 6 --soil_depths 6 --no_management --aggregator_type mean \
            --train_week_start 52 --validation_week 52 \
            --mask_prob 0.5 --mask_value zero
    done
done

# python main.py --dataset soybeans_weekly --data_dir /mnt/beegfs/bulk/mirror/jyf6/datasets/crop_forecast/data/combined_dataset_weekly.npz  \
#     -adj ../map/us_adj.pkl --crop_id_to_fid ../map/soybean_fid_dict.pkl \
#     --mode train --length 5 -bs $1 --max_epoch 100 --test_year 2020 -lr $2 \
#     --eta_min 1e-5 --check_freq 80 --T0 100 -sche $3 --dropout 0.1 --z_dim 64 \
#     --crop_type soybeans --num_weather_vars 23 --num_management_vars 96 --num_soil_vars 20 \
#     --num_extra_vars 6 --soil_depths 6 --no_management --aggregator_type mean \
#     --train_week_start 52 --validation_week 52 \
#     --mask_prob 0.5 --mask_value zero

# ./run_train.sh 64 1e-4 cosine