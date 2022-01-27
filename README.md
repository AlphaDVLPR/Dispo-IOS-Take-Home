# My Planning Process..

Before I coded anything I always like to plan out what I should do beforehand. I'll draw up a few diagrams brainstorming how I think the flow will go. Now, this is just a very rough idea of what I think the application will look like. Although, I do feel it is important that way I have a general understanding on how I should do things instead of just jumping right in.

## Key Features

After reading the given instructions for this project. This was my main take aways of what needed to be done. Also, a few things that would be 'nice to haves' for this application. Again, this is just my brainstorming phase.

![Screen Shot 2022-01-26 at 11 34 09 PM](https://user-images.githubusercontent.com/51697381/151304784-6e9dd748-8e09-4fc8-bd65-db8205512ff5.png)

## Application UI Rough Mock Up

Here I drew up the screens I felt the application would need. Along with a basic sketch of how I think the layout should look.

![Screen Shot 2022-01-26 at 11 37 13 PM](https://user-images.githubusercontent.com/51697381/151305307-692f3c24-6823-44f1-82fd-dfbe305d9e2b.png)

## Application Flow

I am planning on following an MVC design pattern.

![Screen Shot 2022-01-26 at 11 41 48 PM](https://user-images.githubusercontent.com/51697381/151305806-a4f79083-7596-443d-b5d7-bd84e834227e.png)

# Development Process

After brainstorming my ideas I then had a solid direction of where I wanted to go with this application. With this in mind I jumped right into code.

### Integration

- Implementation of Snapkit
- Following MVC Design Pattern
- Custom constrains for custom cells, collection views, and detailview
- Images are animated to follow the look of a Gif
- Images are Cached for optimization.
- UserDefaults are used to store minimal data for the DetailView
- All UI done programatically (No storyboards or SwiftUI)
- Functions built to handle duplicate code handling
- Giphy API Network requests

### Things I Struggled With

The farther I got into the development process the more I realized it wasn't quite a walk in the park. Here are a few road blocks that slowed me down but I was still able to find a way around it.

- Once images were retrieved from the Giphy API getting them to display then animate.
- Image Caching for optimization was a little bit of a challenge due to the way I had written my code to animate these images
- Programmatic UI is not something I normally do with UIKit. So doing this project helped me learn a ton on that and snapkit! I almost now prefer to do it this way over storyboards now.

### Nice to haves

Due to the time constraints I had on my project here are a few things I would have added if given the time

- Error handling done with alerts to the user. Along with a seperate enum with cases.

### Bugs

- Weird glitch coming from inbetween searches and trending results. Most likely coming from a delay in loading times between network requests.

# Here is the final!

![Initial Screen](https://user-images.githubusercontent.com/51697381/151309118-e4dfb626-783e-4e7d-a74b-770703a76af8.png)

![Screen Searched](https://user-images.githubusercontent.com/51697381/151309134-29e67239-fd9b-4fdb-93b0-1ad882d36f52.png)

![Detailed Screen](https://user-images.githubusercontent.com/51697381/151309150-b2fbe666-c5f5-4628-a7fa-6e80853acffe.png)

# Wrap Up

All in all I thought this was a really fun project. I have learned quite a bit from this. I feel even though this was a take home assesment I still wanted to polish it in a way that I would be proud of. Check out the project for yourself!
