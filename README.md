# UnsplashGallery

![Uploading Screenshot 2024-10-16 at 10.14.44 p.m..png…]()

**UnsplashGallery** is an iOS app I built as part of my learning process in Swift development. It connects to the Unsplash API and displays a gallery of photos in a table view. This project helped me deepen my understanding of iOS app architecture, especially the use of ViewModels and optimizing performance using caching techniques.

## Project Overview

UnsplashGallery fetches a list of photos from Unsplash and displays them in a scrollable table view. Each cell contains a photo and a brief description (`altDescription`). This app is structured using the MVVM (Model-View-ViewModel) design pattern, which helped me separate concerns between UI and business logic.

### Key Learnings

- **API Integration**: I learned how to fetch data from the Unsplash API using `URLSession`, parse JSON responses, and display the results in a user-friendly way.
  
- **MVVM Architecture**: The project is built following the MVVM pattern, which improved my understanding of separating data handling from UI updates.

- **UITableView Customization**: I learned how to customize `UITableViewCell` to display images and descriptions. I used Auto Layout to structure the content of each cell dynamically.

- **Image Caching with NSCache**: To optimize performance, I implemented image caching using `NSCache`. This allowed me to store downloaded images in memory and reuse them when needed, reducing the need for redundant network requests.

### Key Components

- **UnsplashViewController**: Manages the display of photos in a `UITableView`. It handles data source and delegate methods to configure the cells and fetch images when necessary.

- **UnsplashViewModel**: Contains the business logic for fetching photos and managing the data flow. It communicates with the API and passes data to the view for display.

- **CustomTableViewCell**: A custom cell used to display an image and its description. I used Auto Layout to dynamically position the image and text.

### Next Steps

- Continue exploring more advanced Swift concepts, like SwiftUI and Combine.
- Improve app performance by exploring additional caching strategies or offline support.
- Experiment with different design patterns to better understand their use cases.

## Conclusion

This project represents a significant milestone in my Swift learning journey. I have grown more comfortable working with networking, data parsing, and UI updates, and I am excited to continue building more advanced iOS applications in the future.
