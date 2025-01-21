#!/bin/bash

# Create directories for odd and even files
mkdir -p odd even

for file in *; do
    # Skip if it's a directory
    [ -d "$file" ] && continue

    # Extract the number after "index_" in the filename
    index=$(echo "$file" | grep -oP '(?<=index_)[0-9]+')

    # Check if an index was found
    if [[ -z "$index" ]]; then
        echo "Warning: No numeric index found in file '$file'. Skipping."
        continue
    fi

    # Determine if the index is odd or even
    if (( index % 2 == 0 )); then
        mv "$file" even/
    else
        mv "$file" odd/
    fi
done

echo "Files have been separated into 'odd/' and 'even/' directories."
#!/bin/bash
mkdir -p odd even

for file in *; do
    index=$(echo "$file" | grep -o "[0-9]\+")
    if [ $((index % 2)) -eq 0 ]; then
        mv "$file" even/
    else
        mv "$file" odd/
    fi
done
echo "Files have been separated into 'odd/' and 'even/' directories."
