
1. Build Tools & Versions used: Xcode 11.3.1 alongwith iOS 13.3 running on iPhone 11 Pro Max
2. Your Focus Areas : I focused on writing clean code with a good architecture. Since I read on the "What to know" section regarding the use(or no use) of storyboards, I focused on creating all the view programmatically instead of a storyboard. I did not stress too much on UI details but made it look presentable. I pulled off some image assets from the internet, but did not spend too much time looking. I believe with the right image assets, I could have done a better job with the error state UI. 
3. Copied-in code or copied-in dependencies - There are no straight copies of code from the internet or previous projects of mine. Though I did use some inspiration from some sources with regards to programmatic view creation(especially the EmployeeTableViewCell).
4. Tablet / phone focus - Mostly focused on building the app for the iPhone.
5. How long you spent on the project - I spent around 4 hours 50 minutes on the project. I made sure to include some Unit tests and make the code testable. Also I tried to do the UI completely programmatically.
6. Anything else you want us to know - Not really, I really appreciate the opportunity and hope the code passes the bar set by Square :) 
The Image Cache which I wrote is a wrapper around NSCache though we can make it better by setting fine grained control policies and also saving compressed images instead of the entire image data from the server. 
The Error state of malformed employees currently returns an Invalid state UI, though I wasn't sure if the expected state should be an "No Employees UI" or an "Error UI"
