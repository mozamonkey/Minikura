# Minikura
Project developed in Tokyo aimed to build virtual warehouse organizer for increased efficiency and customization for your Minikura products

## Inspiration
I have always been interested in optimization in various industries. I pitched an application to some of the biggest hospitals in Canada and achieved investor funding. Through this experience, I learned a fair amount about the importance of efficiency in various industries - healthcare and consumerism are some of the biggest. This is why the challenge given by Terrada stood out to me. They were trying to create a larger business model, but by providing better service you could increase efficiency and satisfy customers more. This creates a more loyal consumer base.

## What it does
This application focusses on three major services:

1) Expansion of Business Model - 
Through the analysis of the logistics behind the storage system at Terrada, the options of a larger business model lied within the storage boxes. Through the convenience of customizing each Minikura with helpful features, consumers would attain greater comfort with a smaller increase in price. For instance, with the click of a button you can customize sizes of boxes. As a consumer, I would throw as many items I didn't need as possible into a box. What if you could pay someone to sort them? What if you had multiple boxes and decided to change items in each Minikura? This is where we discover the increased efficiency for consumers.

2) Increased Efficiency for Consumers - 
The biggest idea behind efficiency was the creation of this "virtual planner" which organized what you wanted to put in a Minikura. This would speed up the process which would usually take hours. Through the combination of two very new yet innovative machine learning libraries, we can use this application to accurately identify an object and collect data to predict what box each item would fit in. The PayPal implementation is seamless so you can pay off fixed fees instantly, so you can focus on the monthly fees. This increases Terrada's business model since this would expose consumers to an accurate variety of items necessary for a successful delivery. Clarifai would place tags while the Vision API would try to match the tags with characteristics to reach an accurate conclusion. Using the tags, the object would then be virtually placed into a Minikura. Once you've scanned every item, you would now have a general idea of what you can place in certain boxes. This would be emailed to you. The other major conveniences for customers are the one click orders for Minikura, which have minimal steps and the tap to customize features. Using a simple scroll, you can tell Terrada if you want to sort papers, scan them, or if you have multiple Minikura - which ones you want to organize items between. These various features improve customer satisfaction.

3) Improved Delivery Approximations
The other big development in this application is the delivery approximations. Companies forget that delivery is one of the driving forces for conversion rates. If you want to keep customers coming back - provide them with good service, especially for your deliveries. Many study have shown that over 50% of customers have cancelled orders because of inadequate delivery options, and others stopped associating themselves with a company for bad deliveries. Now, we can’t prevent bad deliveries since there are so many factors influencing them. However, companies tend to stick to a specific API or resource to provide information to consumers which isn’t good enough. For instance, Amazon is using the UPS API which has had the same formulaic approach. What if we implement a new API, and combine its results with other sources? By using Amarex, we could estimate fleight and carrier times. Through the combination of this data with other local estimating APIs (like Shippo), we can determine an average time Minikura products can be delivered to Terrada, to other people and back to you!

## How I built it
This entire application is built on an iOS device using Swift/Xcode. I used various APIs since some wouldn’t work together. This entire project exposed me to lots of SDKs since quite a few didn’t work well which is a great learning experience. I used PayPals API to implement a payment feature, Amarex API, Vision SDK, Clarifai API and Minikuras API.

A combination of SDKs were used through Cocoapods to create a better UI as well (animations, shapes, etc).

## Challenges I ran into
Due to Swift/Xcode being a relatively new language, the program did experience various bugs. There were many occasions where the application would crash and would require immense tinkering which wasn’t even cause by the programming itself. In addition, there were some big SIGABRT crashes which provide extremely vague error messages which were tedious and required code to be rewritten. An issue for my development included the inability to use multiple APIs to collect data. A couple APIs weren’t working properly because they were tied to other SDKs which made it difficult to produce a more accurate model.

## Accomplishments that I'm proud of
I was able to work with the Vision SDK that Apple introduced for the first time, which was very exciting for me. Through the Vision SDK, I was able to build a live machine learning model through the camera. I worked with Clarifai before, but Vision was a new experience. The use of the PayPal API was very simple and worked seamlessly with my product which was exciting. Finally, I have always been passionate about the languages, but the good design principles that go into the UX. I was able to design a UI which (in my opinion) was very attractive to consumers.

## What I learned
I learned to save projects much more frequently and to always test code, especially on Xcode since crashes happen very often. I also learned a lot about new APIs which I will definitely implement into future projects.

## What's next for Minikura Virtual Warehouse
Minikura’s next step is to provide the concept of “choice” to consumers. That concept is very important to a consumer base since it allows them to explore more options and in the warehousing departments there isn’t usually much to explore for customers. Giving them the option to customize is very innovative in the customers perspective since it makes certain tasks in storage easier. Providing faster options to manage and create storage is important, which is something my prototyped model provides.
