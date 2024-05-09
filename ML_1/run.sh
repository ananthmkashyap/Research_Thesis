# Define batch sizes
batch_sizes=(64)

# Iterate over batch sizes
for batch_size in "${batch_sizes[@]}"; do
    # Define learning rates
    learning_rates=(0.1)

    # Iterate over learning rates
    for lr in "${learning_rates[@]}"; do
        current_time=$(date +"%Y-%m-%d %T")
        echo "[$current_time] Training with batch size $batch_size and learning rate $lr"
        python main.py --batch-size $batch_size --lr $lr --epochs 100 
        end_time=$(date +"%Y-%m-%d %T")
        echo "[$end_time] Finished training"
        sleep 50  # Introduce a delay of 50 seconds
    done
done


