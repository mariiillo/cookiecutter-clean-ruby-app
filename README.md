# cookiecutter-clean-ruby-app
Ruby cookiecutter to scaffold a ruby app following Clean Architecture guidelines

## Clean Architecture in a nutshell

![Clean Architecture](http://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

### Entities *(yellow ring)*

### Use Cases *(red ring)*

### Delivery *(green ring)*

### Infrastructure *(blue ring)*

### Dependencies
Each layer is only allowed to depend on inner layers, i.e. Infrastructure => Delivery => Use Cases => Entities

## Project Structure
The generated project is tailored following the rules and guidelines of what Uncle Bob recommended in [his Post](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
Under the project's /lib folder, there will be a directory for each layer shown in the image.
