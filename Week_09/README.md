### Week 9 code examples

Get data from the network

**ICT Profs**
- example sequence #1
- synchronous/blocking (OK for small data packages, but usually bad)
- based on an earlier example, it fetches a professor's photo from the School of ICT web site

**Ratings bad**
- example sequence #2
- pure Cocoa approach to send an asynchronous request (in iOS 6) 
- doesn't scale; too much code

**Ratings**
- example sequence #3
- big improvement over "Ratings bad"; uses the AFNetworking library (version 1.x for iOS 6)

**iTunes v1**
- example sequence #4
- query a web service, with a static query
- the Model class is the home for requests to the network, NOT the controller

**iTunes v2**
- example sequence #5
- based on above; enables a user-entered query

**Ratings good**
- example sequence #6
- best practice example
- uses a dedicated/singleton 'HTTP client' object for all requests to a web service
