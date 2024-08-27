#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null
then
    echo "ImageMagick could not be found. Please install it with:"
    echo "sudo apt-get install imagemagick"
    exit 1
fi

# Check if the source image exists
if [ ! -f "Bulb.ai.cropped.png" ]; then
    echo "The file Bulb.ai.cropped.png does not exist in the current directory."
    exit 1
fi

# Convert image to have transparency
echo "Converting image to have transparency..."
convert Bulb.ai.cropped.png -alpha set -transparent white -colors 256 favicon_transparent.png

# Resize for favicon
echo "Resizing image for favicon..."
convert favicon_transparent.png -resize 32x32 favicon_32.png

# Optimize the favicon
echo "Optimizing favicon..."
optipng favicon_32.png

# Display the favicon for verification
echo "Displaying the new favicon for verification..."
eog favicon_32.png &

# Inform user how to use the favicon in HTML
echo "To use this favicon in your HTML, add the following line to your <head> section:"
echo '<link rel="icon" type="image/png" href="/path/to/favicon_32.png">'

echo "Favicon creation completed. Check the favicon with the image viewer that just opened."