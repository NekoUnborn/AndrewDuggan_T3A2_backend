## Description of your website, including:

### Purpose

The application concept chosen is an application that provides parents a checklist for the various medications that their children may have to take. The main purpose of the application is to ensure that the children are taking their medication.

The application also has a sub purpose of building good habits within the users by utilising positive reinforcement via a rewards system.

### Functionality / features

MVP

- Login (Username, email, password)
- Allows parents to view all listed medication
- Allows parents to add medicine information
- Multiple Childs for each parent user
- Parents can create a checklist
- Parents can modify an existing checklist
- Reward system
- Reminder system

Extras

- Image upload system
- Pushing reminders via email and mobile notifications (add PhoneNumber to User)
- Parental controls (lock down everything except checklist)
- Parents can view reward history

### Target audience

The target audience for the application will be parents. Specifically parents with kids that need medicine. Due to parents quite often being busy with other their careers or other errands that they need to run, remembering the specific times that their children's medication needs to be taken, and following up with it can escape them. Hence with an application that acts as a checklist and pushes notifications to them will be highly advantageous to them.

### Tech stack

The tech-stack that will be utilised in the project will focus on the use of Ruby on Rails, in an api format for the backend functions of the application.

For the front-end functions of the application, the framework React will be utilised to make a component based scaffold.

The web-hosting service used for the application will be the free service Heroku. This was decided due to the teams previous experience with the service and easily integrated terminal or console tool that Heroku utilises for deployment purposes.

In terms of source control software, Github has been chosen as the available features of the service matches what is required for the project to be successful. The developers on the team also have a moderate amount of experience using Github as a source control system adding more reason to use it.

Due to the project having a possible feature of utilising image upload, an image storage method needs to be considered. Upon discussion within the team, the best choice was deemed to be the cloud storage service Cloudinary. This is primarily due to the fact that this has been used in the past with previous projects and has shown reliability when it has been used.

## Dataflow Diagrams

<!-- CMP1043-4.2 Dataflow Diagram - Provides dataflow diagram(s) that strictly follow the standard convensions to clearly identify the processes within your application. Clearly depicts where data is coming from, where it is going and how it is being stored. -->

### User Functions

![User](./docs/T3A2_DFDs-User.png)

### Child Functions

![Child](./docs/T3A2_DFDs-Child.png)

## Application Architecture Diagram

<!-- CMP1043-4.3 Application Architecture Diagram - Shows understanding of the high level structure of the app -->

![AAD](./docs/T3A2_AAD.png)

## User Stories

<!-- CMP1043-5.1 Provide UX/UI design documentation(user stories) that adequately show Agile methodology implementation. - Provides multiple user stories that use ‘persona, what and why’ that outline meaningful features of project. Shows evidence of user story revision and refinement. -->

MVP

- As a parent, I want a Login system so I can login and see the various information on any device whilst i am on the go.
- As a parent, I want to add medicine to the list if it does not already exist, in order to keep the list accurate.
- As a parent i would like to be able to have a separate list for each of my children, so i can easily track everyone in my family
- As a Parent, I want to make a medicine checklist in order to allow my children to take their medicine.
- As a kid, I want to have an understandable description of what the medicine does, so I can know why I am taking it.
- As a kid, I want a Reward system to give me incentive to take my medicine.
- As a parent, I want a Reminder system so I can be told if my kids have not had their medicine.

Extras

- As an Admin, I want full access, so I can administer the application.
- As a parent/kid, I would like to have an Image of the medicine so I know what the medicine looks like
- As a busy parent, I would like the reminders to be sent to my mobile, so I can still receive them on the go.
- As a parent, I want to stop the children from accessing the editing features in order to stop them from changing the checklists.
- As a parent, I want to be able to look up the reward history to see if my children have been taking their medicine.
- As a parent/user i would like to be able to sign up using my google account, as it makes it easier to access, and manage my data and what has access to it.

## Wireframes for multiple standard screen sizes, created using industry standard software

## Mobile Wireframes

### Misc Pages:

#### Login:

![Login Page for mobile](./docs/wireframes/mobile/Login.png)

The login page has been designed this way to suit a few different concepts. The main concept it is aiming to achieve is simplicity. By only showing the form, name of the app and a simple image, the user is not bombarded with information, and the purpose and goal of the page is made clear. This also links in well with the reasoning for the form to be centered on the page. By centering it, the form becomes the user's focus and they will complete that first. Once the form is complete and submitted, the page will then link to the primary home page.

The logo and image act as a box that contains the form and breaks up the white space on the page, making the page seem more lively and aesthetically appealing.

Another point of note on this page is that the menu or hamburger menu icon is not present. This was an intentional design choice to prevent users trying to navigate away from the page before logging in or signing up. It is assumed that a user may still try to navigate away using the URL, however authentication will be applied to counteract this aspect.

#### Sign-up:

![Signup Page for mobile](./docs/wireframes/mobile/SignUp.png)

The sign-up page follows almost identical reasoning as the login page. With only a small addition to the form as additional information is required to sign up a user to the website.

#### Nav Bar Page (Hamburger Menu)

![Mobile view on how the Hamburger menu will look](./docs/wireframes/mobile/Nav.png)

This view is a rough idea on what the hamburger menu will look like once the user has clicked on it. The positioning of the hamburger menu icon will be placed on the top left corner, due to the way a user eye tracks and flows across a page (Left to right, top to bottom).

<hr>

### User Management Pages

#### Home Page:

![Home Page for the application in mobile view](./docs/wireframes/mobile/Home.png)

This page acts as the dashboard for the website and will be the primary page that the users interacts with. Because of this, the page is very basic and simple. The page is split into roughly three very simple components, the logo, a button that links to the different medications, and the medications CRUD functions, and a control center for the different checklists and children that the user has previously registered, as well as a link to add a new child.

Priority of space was given for the Child Control center, due to this being a more important aspect of the dashboard, while also containing the most data and information on the page as well. The other aspects of the page merely act as links or items to fill in unnecessary white space. The lines at the top and bottom of the pages were decided upon, to create a pseudo container for all of the items on the page, forcing the users to focus on the centered content, and avoid the empty edges of the page.

#### Change Username/Email Page:

![Mobile View of the Change email or username form](./docs/wireframes/mobile/UpdateDetails.png)

Once again, much like the login and sign-up pages, the change details page, utilises a centered form and image to draw the attention of the user to the main focus of the page. This also ties in with the aim to make the application aesthetically pleasing to the user, and achieve a sleek and streamlined design.

<hr>

### Medication CRUD Functionality:

#### Index:

![Medication Index Page](./docs/wireframes/mobile/Medication-Index.png)

This page is where the user will be able to view the entire range of medication currently available to be viewed or added to a checklist.A grid layout of all of the medication is utilises to neatly layout and order the medication. This was done to achieve the client goal of the application being visually appealing to its users, as well as following the natural way that user's eye movement flows. By ordering in the natural way eye movement flows, it makes it easier for the user to find, interact and view the listed medications.

#### Add Medication:

![Page and Form to add a medication to the stored list](./docs/wireframes/mobile/AdMedication.png)

When adding a medication to the DB, the application will render a component made up of a simple heading and single page form. This is to ensure that the process is as simple as possible for the user and avoid causing any confusion, with unnecessary images and fields.

The single page form was chosen due to the fact that the amount of input fields that the user has to fill out is a very small amount, hence rendering multiple components would be a waste, as well as cause issues if the user wanted to change data in a previous field.

The two buttons below the form allow the user to either return back to the previous page without submitting any data, or if they are happy to add their desired medication, then the submit button will send the data to the server and then redirect the user back to the medication index page.

<hr>

### Kid/Child CRUD Functionality:

#### Show Kid:

![Show Individual Child and their checklist of medication](./docs/wireframes/mobile/ShowKid.png)

This page represents an individual page that the user can access to view an individual checklist that they have created. This page displays the name of the checklist/child that has been created at the top of the page, so the user can easily see what checklist they are looking at right away and can either continue or change to another list if they need to.

Following the heading, and acting as the main content of the page is the checklist component. This has been centered to draw all focus to itself. This was also the reasoning behind making it so large. Within the checklist component, there are two columns, each aligned to their respective sides, i.e The checkboxes and text are aligned to the left, while the time input field is aligned to the right side of the component. Each checkbox and their matching time field are left on the same line, so users can imply and understand that they are related.

These features also work to improve the overall style of the page and make it pleasant for the user to look at.

#### Add/Edit Child:

![Part 1 of the add/edit child form in mobile view](./docs/wireframes/mobile/AddEditKid2.png)
![Part 2 of the add/edit child form in mobile view](./docs/wireframes/mobile/AddEditKid1.png)

Need to update these wireframes. Also document the changes made.

<!-- CMP1043-4.1 Utilise an industry standard program for creation of wireframes & CMP1043-5.3 Provide UX/UI design documentation(wireframes) that adequately show Agile methodology implementation. - Provides wireframes that show exceptional planning of project flow and structure including but not limited to space distribution, content prioritisation, intended actions, functions, relationships between screens. -->

## Desktop/Tablet Wireframes:

### Login/Signup:

Login:
![Login Page of the Application](./docs/wireframes/desktop/LoginDesktopTab.png)
The wireframe design was decided on, by taking inspiration from other websites found randomly. The primary reasoning was to make the page aesthetically pleasing. By keeping the page simple, the overall styling of the page is a lot more streamlined and visually appealing.

The sign-in form is kept to the left as that is naturally where the users eye line defaults to.

Sign-up:
![Signup Page of the Application](./docs/wireframes/desktop/SignupDesktopTab.png)

The same principles and reasoning for the login page were also applied to the sign-up page as well.

### Checklist Pages:

Add/Edit Checklist:
![Page and Form to add or edit a Checklist to a  Child for the User](./docs/wireframes/desktop/AddChecklistDesktopTab.png)
This page has two fields. One is the form to create the checklist. The second is a feature to have the user be able to see a preview of the checklist they are making. This adds another level of control for the user, and also fills out the page a bit mroe. The rpeview was placed on the right as it is lower in priority to the user.
Show Medication:
Show Checklist Page:
![Page that displays a selected Checklist for the speciifc user logged in](./docs/wireframes/desktop/ShowCheckDesktopTab.png)

This page was simply designed to shoew the checklist for the user. It was kept simple with only displaying the checklist information and nothing else. This was done to make the page visually appealing and allow the user to find the information they need with ease.

### Medication Pages:

Add Medication:
![Page and Form to add a medication to the medication database](./docs/wireframes/desktop/AddMedDesktopTab.png)
The add medication page features form that is aligned to the l;eft to highlight that it should be the first thing that the user is looking at and using. The page then has a preview feature as a secondary component on the page. This was added to fill out the page a bit more, and add more dynamic interactivity to the page to engage the user.
![Page that displays the entire list of medication for the user to view](./docs/wireframes/desktop/MedIndexDesktopTab.png)

A grid style format for this page was selected, as it was the neatest and most stylised option to display all of the different data that would be output to the page. This method gives ample space for all of the data to be neatly output so the user can read it with ease.

### Misc Pages:

Reset Password:
![Page that displays the form to reset a password](./docs/wireframes/desktop/ResetPassDesktopTab.png)

Update Email or Username:

![Page that displays the form to update User details such as email and username](./docs/wireframes/desktop/UpdateEmailDesktopTab.png)

The rest password and update email pages follow a similar style to the login page, as the content rendered on the page will largely be the same. Hence in order ot keep the style of the page consistent it was decided to have these pages match.

Home/Dashboard Page:
![Page that displays the dashboard and primary page for the users](./docs/wireframes/desktop/HomeDesktopTab.png)

The dashboard page has been designed this way to make the page visually appealing to the user. The children/checklist box takes up the most amount of space due to it being more important than the medication and details fields.

## [Screenshots of your Trello board throughout the duration of the project](https://trello.com/b/knoPp8L3/coderacademyt3a2)

<!-- CMP1043-5.2 Select and follow a commonly used planning methodology, such as Kanban, Trello, Jira, or Asana. - Simple and clear standards for planning methodology chosen and adhered to -->

### 08/07/2021

![08/07/2021](./docs/T3A2trello1.png)

### 13/07/2021

![13/07/2021](./docs/T3A2trello2.png)

## 14/07/2021

![14/7/2021](./docs/T3A2trello3.png)

## 14/07/2021 3:48pm

![14/7/2021 @ 3:48pm](./docs/T3A2trello4.png)


# Application Rubric
## R1. Tech
### - Rails

- ruby
- rails
- pg
- puma
- bootsnap
- rack-cors : Rack-cors added the ability to selectively chose origins that the APi would accept requests from.
- byebug
- spring
- tzinfo-data
- bcrypt : Bcrypt was used to add the ability to create hashed passwords in the database through Rails. 
- jwt - JWT was used to implement user logins, through the use of tokens and ecryption of the token. 
- rspec-rails : This was used as the testing framework for the backend Rails API. 

### - React.js


#### These are the react basic libraries
- react
- react-dom
- react-router-dom : React Router Dom was used to add the ability for the application to function like a multi-page web page by selectively rendering specific components based off the URL
- react-scripts
- styled-components : The styled Componenets library was used to create exportable styled tags to be used to style the application and components
- cypress : Cypress was the testing framework used in React to test the components created and their implementation in various parts of the application

## R2. **Write well designed code that:**


## R3. Employ and utilise proper source control methodology (git)
Github was used as the source control method. The links to the backend API and the Deployed Frontend can be found below: 

Backend Git: https://github.com/NekoUnborn/coderacademy_t3a2_backend
Frontend Git: https://github.com/NekoUnborn/CoderAcademy_T3A2-Frontend

## R4. **Demonstrate your ability to work in a team**:

### - Use a recognised project management methodology
We used the AGILE methodology

### - Use a recognised task delegation methodology
We used Trello for task delegation (though we should have separated the front and back end tasks)
https://trello.com/b/knoPp8L3/coderacademyt3a2


## R6. Deploy the application to a cloud hosting service
### Deployed to Netlify
https://cranky-tereshkova-006e78.netlify.app/


## R8. **Provides evidence of user testing**:

### - In the development environment

### - In the production environment

## R9. Utilises a formal testing framework
Using:
  RSPEC for Backend (Rails)
  Cypress for frontend (React)

