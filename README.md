# cookiecutter-clean-ruby-app
Ruby cookiecutter to scaffold a ruby app following Clean Architecture guidelines

---

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
As Uncle Bob says: 
> This layer is where all the details go. The Web is a detail. The database is a detail. We keep these things on the outside where they can do little harm.

### Dependencies
Each layer is only allowed to depend on inner layers, i.e. Infrastructure => Adapters => Use Cases => Entities.
Of course, a use case must pass the results to the presenter so they can be later on be returned to the user. If a use case calls directly a Presenter, or in other words, if there is a reference to objects in the Adapters layer, the dependency rule will be violated.
The solution to this architectural problem comes thanks to the [Dependency Inversion Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle), a.k.a DIP, which allows in this cases, that a use case can receive as paramenter an instance of an object from the outer layer, and then it can send messages to it. The final workflow is the same, but the difference is that the use case does not [know nothing](https://33.media.tumblr.com/7469601972f65e2b2adb5f8aa5e846a5/tumblr_nda8fsYNKr1tfg6t4o1_500.gif) about that class from the Adapters layer, it just sends a message to some object that is supposed to be a presenter. [Duck Typing FTW](https://en.wikipedia.org/wiki/Duck_typing)

---

## Project Structure
The generated project is tailored following the rules and guidelines of what Uncle Bob recommended in [his Post](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
Under the project's /lib folder, there will be a directory for each layer shown in the image.

---

## Usage
Execute in your command shell
```
$ cookiecutter gh:emeve89/cookiecutter-clean-ruby-app
```

You will be asked to input some parameters needed to completely set up the application.

### Pre Conditions
While bootstrapping the application, you'll need to input a name of a github repository, so that cookiecutter can configure the local repository (but also commit/push the new files created to the remote repository).
