# A photo blog written in rails
I'm a hobbyist photographer and I've been looking for a place to blog a little bit about my travel snapshots or cycling adventures in Tokyo.

## Process
Since it's a blog, I wanted more rich text editing options than a simple textarea, so I looked into the Trix editor/Action Text for Rails 6, but I wasn't satisfied with the image placement abilities. I instead settled on using TinyMCE and though it was a bit trickier to integrate with Active Storage/Cloudinary, I found it offered a lot more flexibility (plugins, etc.) in terms of rich text editing or having posts with rich media.
I also wanted a way to extract EXIF data from images after upload.

# Used
- Rails 6
- Cloudinary for image hosting
- TinyMCE for rich text editing
- MiniMagick for EXIF data extraction from images
- Chartkick for displaying photo stats based on extracted EXIF data
