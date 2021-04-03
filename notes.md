
--Project Requirements--
[ ] Do you have RESTful routes? Do you know what that means?
[x] Build an MVC (Links to an external site.) Sinatra application.
[x] Use ActiveRecord (Links to an external site.) with Sinatra.
[x] Use multiple models.
[x] Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
[x] Must have user accounts - users must be able to sign up, sign in, and sign out.
[x] Validate uniqueness of user login attribute (username or email).
[ ] Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user (CRUD ACTIONS!)
[ ] Ensure that users can edit and delete only their own resources - not resources created by other users.
[ ] Validate user input so bad data cannot be persisted to the database.
[ ] BONUS: Display validation failures to user with error messages (Links to an external site.). (This is an optional feature, challenge yourself and give it a shot!)

--Focus on CRUD actions--
- new (create)
- edit (update)
- index (read)
- show (read)
(^erb file name conventions for CRUD) 
- delete (is just a button)


--Forms for UPDATE and DELETE crud actions that need to be placed in the correct .erb files--
// <form action="/costumes/<%= @costume.id %>" method="PATCH">
//   <input type="text" name="name" value="<%= @costumes.name %>">
//   <input type="submit" value="Update Your Project Name!">
// </form>  
// <br>
// <form action="/costumes/<%= @costumes.id %>" method="POST">
//   <input type="hidden" name="_method" value="DELETE">
//   <input type="submit" value="Delete Costume" >
// </form>
// <br>

--Notes for styling--
- add links (navbar and needed link buttons on pages/ mainly user homepage)
- welcome page logo (need to draw out and then add, center to the page directed to after login)
- clearer labels (drawn out?) and content on pages
- homepage image titles ^
- flash (show error messages)

--Using Bootstrap--
 - create and add small logo to replace the bootstrap navbar logo
- color scheme
- better looking forms
- containers and better layout (use up whitespace)
- CSS file
- background (image?)


Suggestion from Ryan for across page button!---> edit it for yourself tho:
<input type = "submit" onclick="window.location='/scoreboards';" value="Go Back To Home">

Mine---->
<input type = "submit" onclick="window.location='/costumes/:id';" value="Delete Costume"> 
<br>
<input type = "submit" onclick="window.location='/costumes/:id/edit';" value="Edit Costume"> 



suggest from Jill for error message--->
    not_found do
        status 404
        erb :error
      end