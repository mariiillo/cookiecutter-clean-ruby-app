# cookiecutter-clean-ruby-app
Ruby cookiecutter to scaffold a ruby app following Clean Architecture guidelines

## Clean Architecture in a nutshell

![Clean Architecture](http://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

### Entities *(yellow ring)*
This is the place where all the *business objects* as PORO will live. This classes are the least likely to be changes if something in the outter layers changes.

### Use Cases *(red ring)*
In this layer are all the use cases that represent *application specific* business rules. This use cases interact with the Entities and elaborate a response, that will then be passed to the upper layer.
This layer should not be changes in case of any change related to UI, Database, etc. The only reason for these classes to be changes is that the business rules have been changed.

### Adapters *(green ring)*
These are classes that convert data from the most conveniet way for the use cases to the most convenient ways for the outter layer. As the image shows, here will live Controllers, Presenters and Gateways.
As a rule:
* Controller and Presenters will be used to communicate with Devices, Web, UI from the Infrastructure layer.
* Gateways will be used to communicate with the DB and External Interfaces.

### Infrastructure *(blue ring)*
As Uncle Bob says: "This layer is where all the details go. The Web is a detail. The database is a detail. We keep these things on the outside where they can do little harm."

### Dependencies
Each layer is only allowed to depend on inner layers, i.e. Infrastructure => Delivery => Use Cases => Entities

## Project Structure
The generated project is tailored following the rules and guidelines of what Uncle Bob recommended in [his Post](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
Under the project's /lib folder, there will be a directory for each layer shown in the image.
